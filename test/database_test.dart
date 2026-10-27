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
}
