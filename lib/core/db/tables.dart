import 'package:drift/drift.dart';

class Weddings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get weddingDate => dateTime()();
  TextColumn get city => text()();
  IntColumn get guestCount => integer()();
  IntColumn get totalBudget => integer()();
  BoolColumn get planGenerated =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weddingId =>
      integer().references(Weddings, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get templateKey => text().nullable()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {weddingId, templateKey},
  ];
}

class ChecklistItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get eventId =>
      integer().references(Events, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  TextColumn get source => text().withDefault(const Constant('user'))();
  TextColumn get templateKey => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weddingId =>
      integer().references(Weddings, #id, onDelete: KeyAction.cascade)();
  IntColumn get eventId => integer().nullable().references(
    Events,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get name => text()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get assignee => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('todo'))();
  TextColumn get source => text().withDefault(const Constant('user'))();
  TextColumn get templateKey => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class VendorCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weddingId =>
      integer().references(Weddings, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get source => text().withDefault(const Constant('user'))();
  TextColumn get templateKey => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class EventVendorCategories extends Table {
  IntColumn get eventId =>
      integer().references(Events, #id, onDelete: KeyAction.cascade)();
  IntColumn get vendorCategoryId => integer().references(
    VendorCategories,
    #id,
    onDelete: KeyAction.cascade,
  )();
  @override
  Set<Column<Object>> get primaryKey => {eventId, vendorCategoryId};
}

class Vendors extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get vendorCategoryId => integer().references(
    VendorCategories,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get name => text()();
  TextColumn get contact => text().nullable()();
  IntColumn get price => integer().withDefault(const Constant(0))();
  IntColumn get advancePaid => integer().withDefault(const Constant(0))();
  TextColumn get bookingStatus =>
      text().withDefault(const Constant('not_contacted'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class Guests extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weddingId =>
      integer().references(Weddings, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get groupName => text().nullable()();
  IntColumn get peopleCount => integer().withDefault(const Constant(1))();
  TextColumn get rsvp => text().withDefault(const Constant('pending'))();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class GuestEvents extends Table {
  IntColumn get guestId =>
      integer().references(Guests, #id, onDelete: KeyAction.cascade)();
  IntColumn get eventId =>
      integer().references(Events, #id, onDelete: KeyAction.cascade)();
  @override
  Set<Column<Object>> get primaryKey => {guestId, eventId};
}

class ShoppingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weddingId =>
      integer().references(Weddings, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get category => text().withDefault(const Constant('other'))();
  BoolColumn get isPurchased => boolean().withDefault(const Constant(false))();
  TextColumn get source => text().withDefault(const Constant('user'))();
  TextColumn get templateKey => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class BudgetItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get weddingId =>
      integer().references(Weddings, #id, onDelete: KeyAction.cascade)();
  TextColumn get categoryName => text()();
  IntColumn get estimated => integer().withDefault(const Constant(0))();
  IntColumn get actual => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  TextColumn get source => text().withDefault(const Constant('user'))();
  TextColumn get templateKey => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
  DateTimeColumn get updatedAt => dateTime().clientDefault(DateTime.now)();
}

class WaitlistInterests extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get city => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();
}
