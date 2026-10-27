import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedly/core/db/app_database.dart';
import 'package:wedly/features/plan_engine/plan_engine.dart';
import 'package:wedly/features/plan_engine/plan_generator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.customSelect('SELECT 1').get();
  });

  tearDown(() async => database.close());

  Future<Wedding> createWedding() async {
    await database
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
    return database.select(database.weddings).getSingle();
  }

  test(
    'generation is transactional, idempotent, and restores archived events',
    () async {
      final wedding = await createWedding();
      final generator = PlanGenerator(database);

      final summary = await generator.generate(
        wedding: wedding,
        eventKeys: ['mehndi', 'barat', 'walima'],
      );

      expect(summary.events, 3);
      expect(summary.tasks, 18);
      expect(summary.vendorCategories, 7);
      expect(summary.shoppingCategories, 5);
      expect(summary.budgetCategories, 6);
      expect(await database.select(database.events).get(), hasLength(3));
      expect(
        await database.select(database.checklistItems).get(),
        hasLength(24),
      );
      expect(await database.select(database.tasks).get(), hasLength(18));

      final editedItem =
          (await database.select(database.checklistItems).get()).first;
      await (database.update(
        database.checklistItems,
      )..where((row) => row.id.equals(editedItem.id))).write(
        ChecklistItemsCompanion(title: const Value('My edited checklist item')),
      );
      await (database.update(database.events)
            ..where((row) => row.templateKey.equals('mehndi')))
          .write(const EventsCompanion(isArchived: Value(true)));

      await generator.generate(
        wedding: wedding,
        eventKeys: ['mehndi', 'barat', 'walima'],
      );

      expect(await database.select(database.events).get(), hasLength(3));
      expect(
        await database.select(database.checklistItems).get(),
        hasLength(24),
      );
      expect(await database.select(database.tasks).get(), hasLength(18));
      expect(
        (await database.select(database.checklistItems).get()).any(
          (item) => item.title == 'My edited checklist item',
        ),
        isTrue,
      );
      expect(
        (await (database.select(
              database.events,
            )..where((row) => row.templateKey.equals('mehndi'))).getSingle())
            .isArchived,
        isFalse,
      );
    },
  );

  test('unsupported template failure leaves the database unchanged', () async {
    final wedding = await createWedding();

    await expectLater(
      PlanGenerator(
        database,
      ).generate(wedding: wedding, eventKeys: ['mehndi', 'not-a-template']),
      throwsArgumentError,
    );

    expect(await database.select(database.events).get(), isEmpty);
    expect(await database.select(database.checklistItems).get(), isEmpty);
    expect(await database.select(database.tasks).get(), isEmpty);
  });

  test(
    'custom event template keys are stable and distinguish similar names',
    () {
      expect(
        customEventTemplateKey('Family Dinner'),
        customEventTemplateKey(' family dinner '),
      );
      expect(
        customEventTemplateKey('A & B'),
        isNot(customEventTemplateKey('A B')),
      );
      expect(customEventTemplateKey('دعوت'), isNot('custom__'));
    },
  );
}
