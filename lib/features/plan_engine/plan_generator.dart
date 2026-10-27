import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';

import '../../core/db/app_database.dart';
import 'plan_engine.dart';

class PlanSummary {
  const PlanSummary({
    required this.events,
    required this.tasks,
    required this.vendorCategories,
    required this.shoppingCategories,
    required this.budgetCategories,
  });
  final int events;
  final int tasks;
  final int vendorCategories;
  final int shoppingCategories;
  final int budgetCategories;
}

class PlanGenerator {
  PlanGenerator(this.db);
  final AppDatabase db;

  Future<PlanSummary> generate({
    required Wedding wedding,
    required List<String> eventKeys,
    Map<String, String> customEvents = const {},
  }) async {
    final eventTemplates =
        jsonDecode(
              await rootBundle.loadString(
                'assets/templates/event_templates.json',
              ),
            )
            as Map<String, dynamic>;
    final cityTemplates =
        jsonDecode(
              await rootBundle.loadString(
                'assets/templates/city_templates.json',
              ),
            )
            as Map<String, dynamic>;
    for (final entry in customEvents.entries) {
      eventTemplates[entry.key] = {
        'name': entry.value,
        'vendors': ['Venue', 'Catering', 'Photography'],
        'checklist': [
          'Confirm event venue',
          'Finalize event schedule',
          'Choose event outfit',
          'Confirm guest count',
          'Plan event decor',
          'Confirm food and refreshments',
          'Arrange event seating',
          'Share event details with family',
        ],
        'tasks': [
          'Confirm ${entry.value} arrangements',
          'Review ${entry.value} schedule',
        ],
      };
    }
    final plan = PlanEngine.generate(
      eventKeys: eventKeys,
      eventTemplates: eventTemplates,
      cityTemplates: cityTemplates,
      city: wedding.city,
      totalBudget: wedding.totalBudget,
    );

    return db.transaction(() async {
      final eventIds = <String, int>{};
      for (var index = 0; index < plan.events.length; index++) {
        final generated = plan.events[index];
        final existing =
            await (db.select(db.events)..where(
                  (t) =>
                      t.weddingId.equals(wedding.id) &
                      t.templateKey.equals(generated.key),
                ))
                .getSingleOrNull();
        final eventId =
            existing?.id ??
            await db
                .into(db.events)
                .insert(
                  EventsCompanion.insert(
                    weddingId: wedding.id,
                    name: generated.name,
                    templateKey: Value(generated.key),
                    sortOrder: Value(index),
                  ),
                );
        if (existing?.isArchived == true) {
          await (db.update(
            db.events,
          )..where((t) => t.id.equals(eventId))).write(
            EventsCompanion(
              isArchived: const Value(false),
              updatedAt: Value(DateTime.now()),
            ),
          );
        }
        eventIds[generated.key] = eventId;
        for (var i = 0; i < generated.checklist.length; i++) {
          final key = '${generated.key}_check_${i + 1}';
          final found =
              await (db.select(db.checklistItems)..where(
                    (t) =>
                        t.eventId.equals(eventId) & t.templateKey.equals(key),
                  ))
                  .getSingleOrNull();
          if (found == null) {
            await db
                .into(db.checklistItems)
                .insert(
                  ChecklistItemsCompanion.insert(
                    eventId: eventId,
                    title: generated.checklist[i],
                    source: const Value('generated'),
                    templateKey: Value(key),
                  ),
                );
          }
        }
        for (final category in generated.vendorCategories) {
          var vendor =
              await (db.select(db.vendorCategories)..where(
                    (t) =>
                        t.weddingId.equals(wedding.id) &
                        t.name.equals(category),
                  ))
                  .getSingleOrNull();
          if (vendor == null) {
            final key = 'vendor_${category.toLowerCase().replaceAll(' ', '_')}';
            final id = await db
                .into(db.vendorCategories)
                .insert(
                  VendorCategoriesCompanion.insert(
                    weddingId: wedding.id,
                    name: category,
                    source: const Value('generated'),
                    templateKey: Value(key),
                  ),
                );
            vendor = await (db.select(
              db.vendorCategories,
            )..where((t) => t.id.equals(id))).getSingle();
          }
          final linked =
              await (db.select(db.eventVendorCategories)..where(
                    (t) =>
                        t.eventId.equals(eventId) &
                        t.vendorCategoryId.equals(vendor!.id),
                  ))
                  .getSingleOrNull();
          if (linked == null) {
            await db
                .into(db.eventVendorCategories)
                .insert(
                  EventVendorCategoriesCompanion.insert(
                    eventId: eventId,
                    vendorCategoryId: vendor.id,
                  ),
                );
          }
        }
      }

      for (final task in plan.tasks) {
        final existing =
            await (db.select(db.tasks)..where(
                  (t) =>
                      t.weddingId.equals(wedding.id) &
                      t.templateKey.equals(task.key),
                ))
                .getSingleOrNull();
        if (existing == null) {
          await db
              .into(db.tasks)
              .insert(
                TasksCompanion.insert(
                  weddingId: wedding.id,
                  eventId: Value(
                    task.eventKey == null ? null : eventIds[task.eventKey],
                  ),
                  name: task.name,
                  source: const Value('generated'),
                  templateKey: Value(task.key),
                ),
              );
        }
      }

      for (final item in plan.shoppingItems) {
        final key =
            'shopping_${item.$1.toLowerCase()}_${item.$2.toLowerCase().replaceAll(' ', '_')}';
        final existing =
            await (db.select(db.shoppingItems)..where(
                  (t) =>
                      t.weddingId.equals(wedding.id) &
                      t.templateKey.equals(key),
                ))
                .getSingleOrNull();
        if (existing == null) {
          await db
              .into(db.shoppingItems)
              .insert(
                ShoppingItemsCompanion.insert(
                  weddingId: wedding.id,
                  name: item.$2,
                  category: Value(item.$1.toLowerCase()),
                  source: const Value('generated'),
                  templateKey: Value(key),
                ),
              );
        }
      }

      for (final category in plan.budgetCategories) {
        final key =
            'budget_${category.name.toLowerCase().replaceAll(' ', '_')}';
        final existing =
            await (db.select(db.budgetItems)..where(
                  (t) =>
                      t.weddingId.equals(wedding.id) &
                      t.templateKey.equals(key),
                ))
                .getSingleOrNull();
        if (existing == null) {
          await db
              .into(db.budgetItems)
              .insert(
                BudgetItemsCompanion.insert(
                  weddingId: wedding.id,
                  categoryName: category.name,
                  estimated: Value(category.estimate),
                  source: const Value('generated'),
                  templateKey: Value(key),
                ),
              );
        }
      }

      await (db.update(
        db.weddings,
      )..where((t) => t.id.equals(wedding.id))).write(
        WeddingsCompanion(
          planGenerated: const Value(true),
          updatedAt: Value(DateTime.now()),
        ),
      );

      return PlanSummary(
        events: plan.events.length,
        tasks: plan.tasks.length,
        vendorCategories: plan.vendorCategories.length,
        shoppingCategories: PlanEngine.shoppingCategories.length,
        budgetCategories: plan.budgetCategories.length,
      );
    });
  }
}
