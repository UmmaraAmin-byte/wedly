import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Weddings,
    Events,
    ChecklistItems,
    Tasks,
    VendorCategories,
    EventVendorCategories,
    Vendors,
    Guests,
    GuestEvents,
    ShoppingItems,
    BudgetItems,
    WaitlistInterests,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'wedly'));
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await customStatement('PRAGMA foreign_keys = ON');
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_events_wedding ON events(wedding_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_tasks_wedding ON tasks(wedding_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_tasks_event ON tasks(event_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_vendor_categories_wedding ON vendor_categories(wedding_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_vendors_category ON vendors(vendor_category_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_event_vendor_event ON event_vendor_categories(event_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_event_vendor_category ON event_vendor_categories(vendor_category_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_guests_wedding ON guests(wedding_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_guest_events_guest ON guest_events(guest_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_guest_events_event ON guest_events(event_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_shopping_wedding ON shopping_items(wedding_id)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_budget_wedding ON budget_items(wedding_id)',
      );
      await customStatement(
        'CREATE UNIQUE INDEX IF NOT EXISTS idx_tasks_template ON tasks(wedding_id, template_key) WHERE template_key IS NOT NULL',
      );
      await customStatement(
        'CREATE UNIQUE INDEX IF NOT EXISTS idx_vendor_template ON vendor_categories(wedding_id, template_key) WHERE template_key IS NOT NULL',
      );
      await customStatement(
        'CREATE UNIQUE INDEX IF NOT EXISTS idx_checklist_template ON checklist_items(event_id, template_key) WHERE template_key IS NOT NULL',
      );
      await customStatement(
        'CREATE UNIQUE INDEX IF NOT EXISTS idx_shopping_template ON shopping_items(wedding_id, template_key) WHERE template_key IS NOT NULL',
      );
      await customStatement(
        'CREATE UNIQUE INDEX IF NOT EXISTS idx_budget_template ON budget_items(wedding_id, template_key) WHERE template_key IS NOT NULL',
      );
    },
  );
}
