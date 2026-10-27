import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedly/core/db/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.customSelect('SELECT 1').get();
  });

  tearDown(() async => database.close());

  test('wedding deletion cascades to events and checklist rows', () async {
    final weddingId = await database
        .into(database.weddings)
        .insert(
          WeddingsCompanion.insert(
            name: 'Ayesha & Hamza',
            weddingDate: DateTime(2027, 5, 10),
            city: 'Islamabad',
            guestCount: 250,
            totalBudget: 2000000,
          ),
        );
    final eventId = await database
        .into(database.events)
        .insert(EventsCompanion.insert(weddingId: weddingId, name: 'Mehndi'));
    await database
        .into(database.checklistItems)
        .insert(
          ChecklistItemsCompanion.insert(
            eventId: eventId,
            title: 'Choose outfit',
          ),
        );

    await (database.delete(
      database.weddings,
    )..where((table) => table.id.equals(weddingId))).go();

    expect(await database.select(database.events).get(), isEmpty);
    expect(await database.select(database.checklistItems).get(), isEmpty);
  });

  test('template keys prevent duplicate generated event rows', () async {
    final weddingId = await database
        .into(database.weddings)
        .insert(
          WeddingsCompanion.insert(
            name: 'Ayesha & Hamza',
            weddingDate: DateTime(2027, 5, 10),
            city: 'Islamabad',
            guestCount: 250,
            totalBudget: 2000000,
          ),
        );
    final generated = EventsCompanion.insert(
      weddingId: weddingId,
      name: 'Mehndi',
      templateKey: const Value('mehndi'),
    );
    await database.into(database.events).insert(generated);
    await expectLater(
      database.into(database.events).insert(generated),
      throwsA(anything),
    );
  });

  test(
    'file-backed wedding data survives closing and reopening SQLite',
    () async {
      final directory = await Directory.systemTemp.createTemp('wedly_db_test_');
      final file = File('${directory.path}/wedly.sqlite');
      AppDatabase? currentDatabase;
      final warningsWereDisabled =
          driftRuntimeOptions.dontWarnAboutMultipleDatabases;
      driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

      try {
        currentDatabase = AppDatabase.forTesting(NativeDatabase(file));
        final weddingId = await currentDatabase
            .into(currentDatabase.weddings)
            .insert(
              WeddingsCompanion.insert(
                name: 'Nadia & Ali',
                weddingDate: DateTime(2027, 9, 10),
                city: 'Islamabad',
                guestCount: 120,
                totalBudget: 2000000,
              ),
            );

        await currentDatabase.close();
        currentDatabase = AppDatabase.forTesting(NativeDatabase(file));
        final wedding = await (currentDatabase.select(
          currentDatabase.weddings,
        )..where((row) => row.id.equals(weddingId))).getSingle();

        expect(wedding.name, 'Nadia & Ali');
        expect(wedding.city, 'Islamabad');
        expect(wedding.guestCount, 120);
      } finally {
        try {
          await currentDatabase?.close();
          await directory.delete(recursive: true);
        } finally {
          driftRuntimeOptions.dontWarnAboutMultipleDatabases =
              warningsWereDisabled;
        }
      }
    },
  );
}
