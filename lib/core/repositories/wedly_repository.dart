import 'package:drift/drift.dart';

import '../db/app_database.dart';

abstract interface class WedlyRepository {
  Stream<Wedding?> watchWedding();
  Stream<List<Event>> watchEvents(int weddingId);
  Stream<List<ChecklistItem>> watchChecklist(int eventId);
  Stream<List<Task>> watchTasks(int weddingId);
  Stream<List<VendorCategory>> watchVendorCategories(int weddingId);
  Stream<List<Vendor>> watchVendors(int categoryId);
  Stream<List<Guest>> watchGuests(int weddingId);
  Stream<List<ShoppingItem>> watchShopping(int weddingId);
  Stream<List<BudgetItem>> watchBudget(int weddingId);

  Future<Wedding?> getWedding();
  Future<Event?> getEvent(int id);
  Future<VendorCategory?> getVendorCategory(int id);
  Future<List<int>> getGuestEvents(int guestId);
  Future<void> saveWedding({
    int? id,
    required String name,
    required DateTime date,
    required String city,
    required int guests,
    required int budget,
  });
  Future<void> deleteAllData();
  Future<void> addWaitlistInterest(String city);
  Future<int> addChecklistItem(int eventId, String title);
  Future<void> updateChecklistItem(int id, {String? title, bool? done});
  Future<void> deleteChecklistItem(int id);
  Future<int> saveTask({
    int? id,
    required int weddingId,
    int? eventId,
    required String name,
    DateTime? dueDate,
    String? assignee,
    String status = 'todo',
  });
  Future<void> deleteTask(int id);
  Future<int> saveVendor({
    int? id,
    required int categoryId,
    required String name,
    String? contact,
    required int price,
    required int advance,
    required String status,
    String? notes,
  });
  Future<void> deleteVendor(int id);
  Future<int> saveGuest({
    int? id,
    required int weddingId,
    required String name,
    String? group,
    required int people,
    required String rsvp,
    List<int> eventIds = const [],
  });
  Future<void> deleteGuest(int id);
  Future<int> saveShoppingItem({
    int? id,
    required int weddingId,
    required String name,
    required String category,
  });
  Future<void> toggleShoppingItem(int id, bool purchased);
  Future<void> deleteShoppingItem(int id);
  Future<int> saveBudgetItem({
    int? id,
    required int weddingId,
    required String category,
    required int estimate,
    required int actual,
    String? notes,
  });
  Future<void> deleteBudgetItem(int id);
  Future<void> deleteEvent(int id);
  Future<int> addEvent(int weddingId, String name);
  Future<void> archiveEvent(int id, bool archived);
}

class DriftWedlyRepository implements WedlyRepository {
  DriftWedlyRepository(this.db);
  final AppDatabase db;

  @override
  Stream<Wedding?> watchWedding() =>
      (db.select(db.weddings)..limit(1)).watchSingleOrNull();
  @override
  Stream<List<Event>> watchEvents(int weddingId) =>
      (db.select(db.events)..where(
            (t) => t.weddingId.equals(weddingId) & t.isArchived.equals(false),
          ))
          .watch();
  @override
  Stream<List<ChecklistItem>> watchChecklist(int eventId) => (db.select(
    db.checklistItems,
  )..where((t) => t.eventId.equals(eventId))).watch();
  @override
  Stream<List<Task>> watchTasks(int weddingId) => (db.select(
    db.tasks,
  )..where((t) => t.weddingId.equals(weddingId))).watch();
  @override
  Stream<List<VendorCategory>> watchVendorCategories(int weddingId) =>
      (db.select(
        db.vendorCategories,
      )..where((t) => t.weddingId.equals(weddingId))).watch();
  @override
  Stream<List<Vendor>> watchVendors(int categoryId) => (db.select(
    db.vendors,
  )..where((t) => t.vendorCategoryId.equals(categoryId))).watch();
  @override
  Stream<List<Guest>> watchGuests(int weddingId) => (db.select(
    db.guests,
  )..where((t) => t.weddingId.equals(weddingId))).watch();
  @override
  Stream<List<ShoppingItem>> watchShopping(int weddingId) => (db.select(
    db.shoppingItems,
  )..where((t) => t.weddingId.equals(weddingId))).watch();
  @override
  Stream<List<BudgetItem>> watchBudget(int weddingId) => (db.select(
    db.budgetItems,
  )..where((t) => t.weddingId.equals(weddingId))).watch();
  @override
  Future<Wedding?> getWedding() =>
      (db.select(db.weddings)..limit(1)).getSingleOrNull();
  @override
  Future<Event?> getEvent(int id) =>
      (db.select(db.events)..where((t) => t.id.equals(id))).getSingleOrNull();
  @override
  Future<VendorCategory?> getVendorCategory(int id) => (db.select(
    db.vendorCategories,
  )..where((t) => t.id.equals(id))).getSingleOrNull();
  @override
  Future<List<int>> getGuestEvents(int guestId) async =>
      (await (db.select(
            db.guestEvents,
          )..where((t) => t.guestId.equals(guestId))).get())
          .map((row) => row.eventId)
          .toList();

  @override
  Future<void> saveWedding({
    int? id,
    required String name,
    required DateTime date,
    required String city,
    required int guests,
    required int budget,
  }) async {
    final companion = WeddingsCompanion(
      name: Value(name.trim()),
      weddingDate: Value(date),
      city: Value(city),
      guestCount: Value(guests),
      totalBudget: Value(budget),
      updatedAt: Value(DateTime.now()),
    );
    if (id == null) {
      await db
          .into(db.weddings)
          .insert(
            WeddingsCompanion.insert(
              name: name.trim(),
              weddingDate: date,
              city: city,
              guestCount: guests,
              totalBudget: budget,
            ),
          );
    } else {
      await (db.update(
        db.weddings,
      )..where((t) => t.id.equals(id))).write(companion);
    }
  }

  @override
  Future<void> deleteAllData() async {
    await db.transaction(() async {
      await db.delete(db.weddings).go();
      await db.delete(db.waitlistInterests).go();
    });
  }

  @override
  Future<void> addWaitlistInterest(String city) => db
      .into(db.waitlistInterests)
      .insert(WaitlistInterestsCompanion.insert(city: city))
      .then((_) {});
  @override
  Future<int> addChecklistItem(int eventId, String title) => db
      .into(db.checklistItems)
      .insert(
        ChecklistItemsCompanion.insert(eventId: eventId, title: title.trim()),
      );
  @override
  Future<void> updateChecklistItem(int id, {String? title, bool? done}) =>
      (db.update(db.checklistItems)..where((t) => t.id.equals(id))).write(
        ChecklistItemsCompanion(
          title: title == null ? const Value.absent() : Value(title.trim()),
          isDone: done == null ? const Value.absent() : Value(done),
          updatedAt: Value(DateTime.now()),
        ),
      );
  @override
  Future<void> deleteChecklistItem(int id) =>
      (db.delete(db.checklistItems)..where((t) => t.id.equals(id))).go();
  @override
  Future<int> saveTask({
    int? id,
    required int weddingId,
    int? eventId,
    required String name,
    DateTime? dueDate,
    String? assignee,
    String status = 'todo',
  }) async {
    final companion = TasksCompanion(
      weddingId: Value(weddingId),
      eventId: Value(eventId),
      name: Value(name.trim()),
      dueDate: Value(dueDate),
      assignee: Value(
        assignee?.trim().isEmpty == true ? null : assignee?.trim(),
      ),
      status: Value(status),
      source: const Value('user'),
      templateKey: const Value(null),
      updatedAt: Value(DateTime.now()),
    );
    if (id == null) {
      return db
          .into(db.tasks)
          .insert(
            TasksCompanion.insert(
              weddingId: weddingId,
              name: name.trim(),
              eventId: Value(eventId),
              dueDate: Value(dueDate),
              assignee: Value(assignee),
              status: Value(status),
            ),
          );
    }
    await (db.update(db.tasks)..where((t) => t.id.equals(id))).write(companion);
    return id;
  }

  @override
  Future<void> deleteTask(int id) =>
      (db.delete(db.tasks)..where((t) => t.id.equals(id))).go();
  @override
  Future<int> saveVendor({
    int? id,
    required int categoryId,
    required String name,
    String? contact,
    required int price,
    required int advance,
    required String status,
    String? notes,
  }) async {
    final values = VendorsCompanion(
      vendorCategoryId: Value(categoryId),
      name: Value(name.trim()),
      contact: Value(contact),
      price: Value(price),
      advancePaid: Value(advance),
      bookingStatus: Value(status),
      notes: Value(notes),
      updatedAt: Value(DateTime.now()),
    );
    if (id == null) {
      return db
          .into(db.vendors)
          .insert(
            VendorsCompanion.insert(
              vendorCategoryId: categoryId,
              name: name.trim(),
              contact: Value(contact),
              price: Value(price),
              advancePaid: Value(advance),
              bookingStatus: Value(status),
              notes: Value(notes),
            ),
          );
    }
    await (db.update(db.vendors)..where((t) => t.id.equals(id))).write(values);
    return id;
  }

  @override
  Future<void> deleteVendor(int id) =>
      (db.delete(db.vendors)..where((t) => t.id.equals(id))).go();
  @override
  Future<int> saveGuest({
    int? id,
    required int weddingId,
    required String name,
    String? group,
    required int people,
    required String rsvp,
    List<int> eventIds = const [],
  }) async {
    final values = GuestsCompanion(
      weddingId: Value(weddingId),
      name: Value(name.trim()),
      groupName: Value(group),
      peopleCount: Value(people),
      rsvp: Value(rsvp),
      updatedAt: Value(DateTime.now()),
    );
    return db.transaction(() async {
      final guestId = id ?? await db
                .into(db.guests)
                .insert(
                  GuestsCompanion.insert(
                    weddingId: weddingId,
                    name: name.trim(),
                    groupName: Value(group),
                    peopleCount: Value(people),
                    rsvp: Value(rsvp),
                  ),
                );
      if (id != null) {
        await (db.update(
          db.guests,
        )..where((t) => t.id.equals(id))).write(values);
        await (db.delete(
          db.guestEvents,
        )..where((t) => t.guestId.equals(id))).go();
      }
      for (final eventId in eventIds) {
        await db
            .into(db.guestEvents)
            .insert(
              GuestEventsCompanion.insert(guestId: guestId, eventId: eventId),
            );
      }
      return guestId;
    });
  }

  @override
  Future<void> deleteGuest(int id) =>
      (db.delete(db.guests)..where((t) => t.id.equals(id))).go();
  @override
  Future<int> saveShoppingItem({
    int? id,
    required int weddingId,
    required String name,
    required String category,
  }) async {
    final values = ShoppingItemsCompanion(
      weddingId: Value(weddingId),
      name: Value(name.trim()),
      category: Value(category.toLowerCase()),
      source: const Value('user'),
      templateKey: const Value(null),
      updatedAt: Value(DateTime.now()),
    );
    if (id == null) {
      return db
          .into(db.shoppingItems)
          .insert(
            ShoppingItemsCompanion.insert(
              weddingId: weddingId,
              name: name.trim(),
              category: Value(category.toLowerCase()),
            ),
          );
    }
    await (db.update(
      db.shoppingItems,
    )..where((t) => t.id.equals(id))).write(values);
    return id;
  }

  @override
  Future<void> toggleShoppingItem(int id, bool purchased) =>
      (db.update(db.shoppingItems)..where((t) => t.id.equals(id))).write(
        ShoppingItemsCompanion(
          isPurchased: Value(purchased),
          updatedAt: Value(DateTime.now()),
        ),
      );
  @override
  Future<void> deleteShoppingItem(int id) =>
      (db.delete(db.shoppingItems)..where((t) => t.id.equals(id))).go();
  @override
  Future<int> saveBudgetItem({
    int? id,
    required int weddingId,
    required String category,
    required int estimate,
    required int actual,
    String? notes,
  }) async {
    final values = BudgetItemsCompanion(
      weddingId: Value(weddingId),
      categoryName: Value(category.trim()),
      estimated: Value(estimate),
      actual: Value(actual),
      notes: Value(notes),
      source: const Value('user'),
      templateKey: const Value(null),
      updatedAt: Value(DateTime.now()),
    );
    if (id == null) {
      return db
          .into(db.budgetItems)
          .insert(
            BudgetItemsCompanion.insert(
              weddingId: weddingId,
              categoryName: category.trim(),
              estimated: Value(estimate),
              actual: Value(actual),
              notes: Value(notes),
            ),
          );
    }
    await (db.update(
      db.budgetItems,
    )..where((t) => t.id.equals(id))).write(values);
    return id;
  }

  @override
  Future<void> deleteBudgetItem(int id) =>
      (db.delete(db.budgetItems)..where((t) => t.id.equals(id))).go();
  @override
  Future<void> deleteEvent(int id) =>
      (db.delete(db.events)..where((t) => t.id.equals(id))).go();
  @override
  Future<int> addEvent(int weddingId, String name) => db
      .into(db.events)
      .insert(
        EventsCompanion.insert(
          weddingId: weddingId,
          name: name.trim(),
          isCustom: const Value(true),
          sortOrder: const Value(999),
        ),
      );
  @override
  Future<void> archiveEvent(int id, bool archived) =>
      (db.update(db.events)..where((t) => t.id.equals(id))).write(
        EventsCompanion(
          isArchived: Value(archived),
          updatedAt: Value(DateTime.now()),
        ),
      );
}
