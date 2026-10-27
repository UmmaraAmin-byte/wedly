// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WeddingsTable extends Weddings with TableInfo<$WeddingsTable, Wedding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeddingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weddingDateMeta = const VerificationMeta(
    'weddingDate',
  );
  @override
  late final GeneratedColumn<DateTime> weddingDate = GeneratedColumn<DateTime>(
    'wedding_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guestCountMeta = const VerificationMeta(
    'guestCount',
  );
  @override
  late final GeneratedColumn<int> guestCount = GeneratedColumn<int>(
    'guest_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalBudgetMeta = const VerificationMeta(
    'totalBudget',
  );
  @override
  late final GeneratedColumn<int> totalBudget = GeneratedColumn<int>(
    'total_budget',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planGeneratedMeta = const VerificationMeta(
    'planGenerated',
  );
  @override
  late final GeneratedColumn<bool> planGenerated = GeneratedColumn<bool>(
    'plan_generated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("plan_generated" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    weddingDate,
    city,
    guestCount,
    totalBudget,
    planGenerated,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weddings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Wedding> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('wedding_date')) {
      context.handle(
        _weddingDateMeta,
        weddingDate.isAcceptableOrUnknown(
          data['wedding_date']!,
          _weddingDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weddingDateMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('guest_count')) {
      context.handle(
        _guestCountMeta,
        guestCount.isAcceptableOrUnknown(data['guest_count']!, _guestCountMeta),
      );
    } else if (isInserting) {
      context.missing(_guestCountMeta);
    }
    if (data.containsKey('total_budget')) {
      context.handle(
        _totalBudgetMeta,
        totalBudget.isAcceptableOrUnknown(
          data['total_budget']!,
          _totalBudgetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalBudgetMeta);
    }
    if (data.containsKey('plan_generated')) {
      context.handle(
        _planGeneratedMeta,
        planGenerated.isAcceptableOrUnknown(
          data['plan_generated']!,
          _planGeneratedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Wedding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Wedding(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weddingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}wedding_date'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      guestCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guest_count'],
      )!,
      totalBudget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_budget'],
      )!,
      planGenerated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}plan_generated'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WeddingsTable createAlias(String alias) {
    return $WeddingsTable(attachedDatabase, alias);
  }
}

class Wedding extends DataClass implements Insertable<Wedding> {
  final int id;
  final String name;
  final DateTime weddingDate;
  final String city;
  final int guestCount;
  final int totalBudget;
  final bool planGenerated;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Wedding({
    required this.id,
    required this.name,
    required this.weddingDate,
    required this.city,
    required this.guestCount,
    required this.totalBudget,
    required this.planGenerated,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['wedding_date'] = Variable<DateTime>(weddingDate);
    map['city'] = Variable<String>(city);
    map['guest_count'] = Variable<int>(guestCount);
    map['total_budget'] = Variable<int>(totalBudget);
    map['plan_generated'] = Variable<bool>(planGenerated);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  WeddingsCompanion toCompanion(bool nullToAbsent) {
    return WeddingsCompanion(
      id: Value(id),
      name: Value(name),
      weddingDate: Value(weddingDate),
      city: Value(city),
      guestCount: Value(guestCount),
      totalBudget: Value(totalBudget),
      planGenerated: Value(planGenerated),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Wedding.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Wedding(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weddingDate: serializer.fromJson<DateTime>(json['weddingDate']),
      city: serializer.fromJson<String>(json['city']),
      guestCount: serializer.fromJson<int>(json['guestCount']),
      totalBudget: serializer.fromJson<int>(json['totalBudget']),
      planGenerated: serializer.fromJson<bool>(json['planGenerated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'weddingDate': serializer.toJson<DateTime>(weddingDate),
      'city': serializer.toJson<String>(city),
      'guestCount': serializer.toJson<int>(guestCount),
      'totalBudget': serializer.toJson<int>(totalBudget),
      'planGenerated': serializer.toJson<bool>(planGenerated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Wedding copyWith({
    int? id,
    String? name,
    DateTime? weddingDate,
    String? city,
    int? guestCount,
    int? totalBudget,
    bool? planGenerated,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Wedding(
    id: id ?? this.id,
    name: name ?? this.name,
    weddingDate: weddingDate ?? this.weddingDate,
    city: city ?? this.city,
    guestCount: guestCount ?? this.guestCount,
    totalBudget: totalBudget ?? this.totalBudget,
    planGenerated: planGenerated ?? this.planGenerated,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Wedding copyWithCompanion(WeddingsCompanion data) {
    return Wedding(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      weddingDate: data.weddingDate.present
          ? data.weddingDate.value
          : this.weddingDate,
      city: data.city.present ? data.city.value : this.city,
      guestCount: data.guestCount.present
          ? data.guestCount.value
          : this.guestCount,
      totalBudget: data.totalBudget.present
          ? data.totalBudget.value
          : this.totalBudget,
      planGenerated: data.planGenerated.present
          ? data.planGenerated.value
          : this.planGenerated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Wedding(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weddingDate: $weddingDate, ')
          ..write('city: $city, ')
          ..write('guestCount: $guestCount, ')
          ..write('totalBudget: $totalBudget, ')
          ..write('planGenerated: $planGenerated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    weddingDate,
    city,
    guestCount,
    totalBudget,
    planGenerated,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Wedding &&
          other.id == this.id &&
          other.name == this.name &&
          other.weddingDate == this.weddingDate &&
          other.city == this.city &&
          other.guestCount == this.guestCount &&
          other.totalBudget == this.totalBudget &&
          other.planGenerated == this.planGenerated &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WeddingsCompanion extends UpdateCompanion<Wedding> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> weddingDate;
  final Value<String> city;
  final Value<int> guestCount;
  final Value<int> totalBudget;
  final Value<bool> planGenerated;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const WeddingsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weddingDate = const Value.absent(),
    this.city = const Value.absent(),
    this.guestCount = const Value.absent(),
    this.totalBudget = const Value.absent(),
    this.planGenerated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  WeddingsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime weddingDate,
    required String city,
    required int guestCount,
    required int totalBudget,
    this.planGenerated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       weddingDate = Value(weddingDate),
       city = Value(city),
       guestCount = Value(guestCount),
       totalBudget = Value(totalBudget);
  static Insertable<Wedding> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? weddingDate,
    Expression<String>? city,
    Expression<int>? guestCount,
    Expression<int>? totalBudget,
    Expression<bool>? planGenerated,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weddingDate != null) 'wedding_date': weddingDate,
      if (city != null) 'city': city,
      if (guestCount != null) 'guest_count': guestCount,
      if (totalBudget != null) 'total_budget': totalBudget,
      if (planGenerated != null) 'plan_generated': planGenerated,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  WeddingsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? weddingDate,
    Value<String>? city,
    Value<int>? guestCount,
    Value<int>? totalBudget,
    Value<bool>? planGenerated,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return WeddingsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weddingDate: weddingDate ?? this.weddingDate,
      city: city ?? this.city,
      guestCount: guestCount ?? this.guestCount,
      totalBudget: totalBudget ?? this.totalBudget,
      planGenerated: planGenerated ?? this.planGenerated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weddingDate.present) {
      map['wedding_date'] = Variable<DateTime>(weddingDate.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (guestCount.present) {
      map['guest_count'] = Variable<int>(guestCount.value);
    }
    if (totalBudget.present) {
      map['total_budget'] = Variable<int>(totalBudget.value);
    }
    if (planGenerated.present) {
      map['plan_generated'] = Variable<bool>(planGenerated.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeddingsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weddingDate: $weddingDate, ')
          ..write('city: $city, ')
          ..write('guestCount: $guestCount, ')
          ..write('totalBudget: $totalBudget, ')
          ..write('planGenerated: $planGenerated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<int> weddingId = GeneratedColumn<int>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weddings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    name,
    templateKey,
    isCustom,
    isArchived,
    sortOrder,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<Event> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {weddingId, templateKey},
  ];
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wedding_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      ),
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final int weddingId;
  final String name;
  final String? templateKey;
  final bool isCustom;
  final bool isArchived;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Event({
    required this.id,
    required this.weddingId,
    required this.name,
    this.templateKey,
    required this.isCustom,
    required this.isArchived,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wedding_id'] = Variable<int>(weddingId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || templateKey != null) {
      map['template_key'] = Variable<String>(templateKey);
    }
    map['is_custom'] = Variable<bool>(isCustom);
    map['is_archived'] = Variable<bool>(isArchived);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      name: Value(name),
      templateKey: templateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(templateKey),
      isCustom: Value(isCustom),
      isArchived: Value(isArchived),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      weddingId: serializer.fromJson<int>(json['weddingId']),
      name: serializer.fromJson<String>(json['name']),
      templateKey: serializer.fromJson<String?>(json['templateKey']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weddingId': serializer.toJson<int>(weddingId),
      'name': serializer.toJson<String>(name),
      'templateKey': serializer.toJson<String?>(templateKey),
      'isCustom': serializer.toJson<bool>(isCustom),
      'isArchived': serializer.toJson<bool>(isArchived),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Event copyWith({
    int? id,
    int? weddingId,
    String? name,
    Value<String?> templateKey = const Value.absent(),
    bool? isCustom,
    bool? isArchived,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Event(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    name: name ?? this.name,
    templateKey: templateKey.present ? templateKey.value : this.templateKey,
    isCustom: isCustom ?? this.isCustom,
    isArchived: isArchived ?? this.isArchived,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      name: data.name.present ? data.name.value : this.name,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('templateKey: $templateKey, ')
          ..write('isCustom: $isCustom, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    name,
    templateKey,
    isCustom,
    isArchived,
    sortOrder,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.name == this.name &&
          other.templateKey == this.templateKey &&
          other.isCustom == this.isCustom &&
          other.isArchived == this.isArchived &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<int> weddingId;
  final Value<String> name;
  final Value<String?> templateKey;
  final Value<bool> isCustom;
  final Value<bool> isArchived;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.name = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required int weddingId,
    required String name,
    this.templateKey = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weddingId = Value(weddingId),
       name = Value(name);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<int>? weddingId,
    Expression<String>? name,
    Expression<String>? templateKey,
    Expression<bool>? isCustom,
    Expression<bool>? isArchived,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (name != null) 'name': name,
      if (templateKey != null) 'template_key': templateKey,
      if (isCustom != null) 'is_custom': isCustom,
      if (isArchived != null) 'is_archived': isArchived,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EventsCompanion copyWith({
    Value<int>? id,
    Value<int>? weddingId,
    Value<String>? name,
    Value<String?>? templateKey,
    Value<bool>? isCustom,
    Value<bool>? isArchived,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      templateKey: templateKey ?? this.templateKey,
      isCustom: isCustom ?? this.isCustom,
      isArchived: isArchived ?? this.isArchived,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<int>(weddingId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('templateKey: $templateKey, ')
          ..write('isCustom: $isCustom, ')
          ..write('isArchived: $isArchived, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ChecklistItemsTable extends ChecklistItems
    with TableInfo<$ChecklistItemsTable, ChecklistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventId,
    title,
    isDone,
    source,
    templateKey,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ChecklistItemsTable createAlias(String alias) {
    return $ChecklistItemsTable(attachedDatabase, alias);
  }
}

class ChecklistItem extends DataClass implements Insertable<ChecklistItem> {
  final int id;
  final int eventId;
  final String title;
  final bool isDone;
  final String source;
  final String? templateKey;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ChecklistItem({
    required this.id,
    required this.eventId,
    required this.title,
    required this.isDone,
    required this.source,
    this.templateKey,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_id'] = Variable<int>(eventId);
    map['title'] = Variable<String>(title);
    map['is_done'] = Variable<bool>(isDone);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || templateKey != null) {
      map['template_key'] = Variable<String>(templateKey);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ChecklistItemsCompanion toCompanion(bool nullToAbsent) {
    return ChecklistItemsCompanion(
      id: Value(id),
      eventId: Value(eventId),
      title: Value(title),
      isDone: Value(isDone),
      source: Value(source),
      templateKey: templateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(templateKey),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ChecklistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistItem(
      id: serializer.fromJson<int>(json['id']),
      eventId: serializer.fromJson<int>(json['eventId']),
      title: serializer.fromJson<String>(json['title']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      source: serializer.fromJson<String>(json['source']),
      templateKey: serializer.fromJson<String?>(json['templateKey']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventId': serializer.toJson<int>(eventId),
      'title': serializer.toJson<String>(title),
      'isDone': serializer.toJson<bool>(isDone),
      'source': serializer.toJson<String>(source),
      'templateKey': serializer.toJson<String?>(templateKey),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ChecklistItem copyWith({
    int? id,
    int? eventId,
    String? title,
    bool? isDone,
    String? source,
    Value<String?> templateKey = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ChecklistItem(
    id: id ?? this.id,
    eventId: eventId ?? this.eventId,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    source: source ?? this.source,
    templateKey: templateKey.present ? templateKey.value : this.templateKey,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ChecklistItem copyWithCompanion(ChecklistItemsCompanion data) {
    return ChecklistItem(
      id: data.id.present ? data.id.value : this.id,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      title: data.title.present ? data.title.value : this.title,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      source: data.source.present ? data.source.value : this.source,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItem(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    eventId,
    title,
    isDone,
    source,
    templateKey,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistItem &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.title == this.title &&
          other.isDone == this.isDone &&
          other.source == this.source &&
          other.templateKey == this.templateKey &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChecklistItemsCompanion extends UpdateCompanion<ChecklistItem> {
  final Value<int> id;
  final Value<int> eventId;
  final Value<String> title;
  final Value<bool> isDone;
  final Value<String> source;
  final Value<String?> templateKey;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ChecklistItemsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.title = const Value.absent(),
    this.isDone = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ChecklistItemsCompanion.insert({
    this.id = const Value.absent(),
    required int eventId,
    required String title,
    this.isDone = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : eventId = Value(eventId),
       title = Value(title);
  static Insertable<ChecklistItem> custom({
    Expression<int>? id,
    Expression<int>? eventId,
    Expression<String>? title,
    Expression<bool>? isDone,
    Expression<String>? source,
    Expression<String>? templateKey,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (title != null) 'title': title,
      if (isDone != null) 'is_done': isDone,
      if (source != null) 'source': source,
      if (templateKey != null) 'template_key': templateKey,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ChecklistItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? eventId,
    Value<String>? title,
    Value<bool>? isDone,
    Value<String>? source,
    Value<String?>? templateKey,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ChecklistItemsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      source: source ?? this.source,
      templateKey: templateKey ?? this.templateKey,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<int> weddingId = GeneratedColumn<int>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weddings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _assigneeMeta = const VerificationMeta(
    'assignee',
  );
  @override
  late final GeneratedColumn<String> assignee = GeneratedColumn<String>(
    'assignee',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('todo'),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    eventId,
    name,
    dueDate,
    assignee,
    status,
    source,
    templateKey,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('assignee')) {
      context.handle(
        _assigneeMeta,
        assignee.isAcceptableOrUnknown(data['assignee']!, _assigneeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wedding_id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      assignee: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignee'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final int weddingId;
  final int? eventId;
  final String name;
  final DateTime? dueDate;
  final String? assignee;
  final String status;
  final String source;
  final String? templateKey;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Task({
    required this.id,
    required this.weddingId,
    this.eventId,
    required this.name,
    this.dueDate,
    this.assignee,
    required this.status,
    required this.source,
    this.templateKey,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wedding_id'] = Variable<int>(weddingId);
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<int>(eventId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || assignee != null) {
      map['assignee'] = Variable<String>(assignee);
    }
    map['status'] = Variable<String>(status);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || templateKey != null) {
      map['template_key'] = Variable<String>(templateKey);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      name: Value(name),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      assignee: assignee == null && nullToAbsent
          ? const Value.absent()
          : Value(assignee),
      status: Value(status),
      source: Value(source),
      templateKey: templateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(templateKey),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      weddingId: serializer.fromJson<int>(json['weddingId']),
      eventId: serializer.fromJson<int?>(json['eventId']),
      name: serializer.fromJson<String>(json['name']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      assignee: serializer.fromJson<String?>(json['assignee']),
      status: serializer.fromJson<String>(json['status']),
      source: serializer.fromJson<String>(json['source']),
      templateKey: serializer.fromJson<String?>(json['templateKey']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weddingId': serializer.toJson<int>(weddingId),
      'eventId': serializer.toJson<int?>(eventId),
      'name': serializer.toJson<String>(name),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'assignee': serializer.toJson<String?>(assignee),
      'status': serializer.toJson<String>(status),
      'source': serializer.toJson<String>(source),
      'templateKey': serializer.toJson<String?>(templateKey),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Task copyWith({
    int? id,
    int? weddingId,
    Value<int?> eventId = const Value.absent(),
    String? name,
    Value<DateTime?> dueDate = const Value.absent(),
    Value<String?> assignee = const Value.absent(),
    String? status,
    String? source,
    Value<String?> templateKey = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Task(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    eventId: eventId.present ? eventId.value : this.eventId,
    name: name ?? this.name,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    assignee: assignee.present ? assignee.value : this.assignee,
    status: status ?? this.status,
    source: source ?? this.source,
    templateKey: templateKey.present ? templateKey.value : this.templateKey,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      name: data.name.present ? data.name.value : this.name,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      assignee: data.assignee.present ? data.assignee.value : this.assignee,
      status: data.status.present ? data.status.value : this.status,
      source: data.source.present ? data.source.value : this.source,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('eventId: $eventId, ')
          ..write('name: $name, ')
          ..write('dueDate: $dueDate, ')
          ..write('assignee: $assignee, ')
          ..write('status: $status, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    eventId,
    name,
    dueDate,
    assignee,
    status,
    source,
    templateKey,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.eventId == this.eventId &&
          other.name == this.name &&
          other.dueDate == this.dueDate &&
          other.assignee == this.assignee &&
          other.status == this.status &&
          other.source == this.source &&
          other.templateKey == this.templateKey &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<int> weddingId;
  final Value<int?> eventId;
  final Value<String> name;
  final Value<DateTime?> dueDate;
  final Value<String?> assignee;
  final Value<String> status;
  final Value<String> source;
  final Value<String?> templateKey;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.name = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.assignee = const Value.absent(),
    this.status = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required int weddingId,
    this.eventId = const Value.absent(),
    required String name,
    this.dueDate = const Value.absent(),
    this.assignee = const Value.absent(),
    this.status = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weddingId = Value(weddingId),
       name = Value(name);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<int>? weddingId,
    Expression<int>? eventId,
    Expression<String>? name,
    Expression<DateTime>? dueDate,
    Expression<String>? assignee,
    Expression<String>? status,
    Expression<String>? source,
    Expression<String>? templateKey,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (eventId != null) 'event_id': eventId,
      if (name != null) 'name': name,
      if (dueDate != null) 'due_date': dueDate,
      if (assignee != null) 'assignee': assignee,
      if (status != null) 'status': status,
      if (source != null) 'source': source,
      if (templateKey != null) 'template_key': templateKey,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<int>? weddingId,
    Value<int?>? eventId,
    Value<String>? name,
    Value<DateTime?>? dueDate,
    Value<String?>? assignee,
    Value<String>? status,
    Value<String>? source,
    Value<String?>? templateKey,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      eventId: eventId ?? this.eventId,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      assignee: assignee ?? this.assignee,
      status: status ?? this.status,
      source: source ?? this.source,
      templateKey: templateKey ?? this.templateKey,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<int>(weddingId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (assignee.present) {
      map['assignee'] = Variable<String>(assignee.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('eventId: $eventId, ')
          ..write('name: $name, ')
          ..write('dueDate: $dueDate, ')
          ..write('assignee: $assignee, ')
          ..write('status: $status, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $VendorCategoriesTable extends VendorCategories
    with TableInfo<$VendorCategoriesTable, VendorCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendorCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<int> weddingId = GeneratedColumn<int>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weddings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    name,
    source,
    templateKey,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendor_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<VendorCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VendorCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VendorCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wedding_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VendorCategoriesTable createAlias(String alias) {
    return $VendorCategoriesTable(attachedDatabase, alias);
  }
}

class VendorCategory extends DataClass implements Insertable<VendorCategory> {
  final int id;
  final int weddingId;
  final String name;
  final String source;
  final String? templateKey;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VendorCategory({
    required this.id,
    required this.weddingId,
    required this.name,
    required this.source,
    this.templateKey,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wedding_id'] = Variable<int>(weddingId);
    map['name'] = Variable<String>(name);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || templateKey != null) {
      map['template_key'] = Variable<String>(templateKey);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VendorCategoriesCompanion toCompanion(bool nullToAbsent) {
    return VendorCategoriesCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      name: Value(name),
      source: Value(source),
      templateKey: templateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(templateKey),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VendorCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VendorCategory(
      id: serializer.fromJson<int>(json['id']),
      weddingId: serializer.fromJson<int>(json['weddingId']),
      name: serializer.fromJson<String>(json['name']),
      source: serializer.fromJson<String>(json['source']),
      templateKey: serializer.fromJson<String?>(json['templateKey']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weddingId': serializer.toJson<int>(weddingId),
      'name': serializer.toJson<String>(name),
      'source': serializer.toJson<String>(source),
      'templateKey': serializer.toJson<String?>(templateKey),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VendorCategory copyWith({
    int? id,
    int? weddingId,
    String? name,
    String? source,
    Value<String?> templateKey = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VendorCategory(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    name: name ?? this.name,
    source: source ?? this.source,
    templateKey: templateKey.present ? templateKey.value : this.templateKey,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VendorCategory copyWithCompanion(VendorCategoriesCompanion data) {
    return VendorCategory(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      name: data.name.present ? data.name.value : this.name,
      source: data.source.present ? data.source.value : this.source,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VendorCategory(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    name,
    source,
    templateKey,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VendorCategory &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.name == this.name &&
          other.source == this.source &&
          other.templateKey == this.templateKey &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VendorCategoriesCompanion extends UpdateCompanion<VendorCategory> {
  final Value<int> id;
  final Value<int> weddingId;
  final Value<String> name;
  final Value<String> source;
  final Value<String?> templateKey;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VendorCategoriesCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.name = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VendorCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int weddingId,
    required String name,
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weddingId = Value(weddingId),
       name = Value(name);
  static Insertable<VendorCategory> custom({
    Expression<int>? id,
    Expression<int>? weddingId,
    Expression<String>? name,
    Expression<String>? source,
    Expression<String>? templateKey,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (name != null) 'name': name,
      if (source != null) 'source': source,
      if (templateKey != null) 'template_key': templateKey,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VendorCategoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? weddingId,
    Value<String>? name,
    Value<String>? source,
    Value<String?>? templateKey,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VendorCategoriesCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      source: source ?? this.source,
      templateKey: templateKey ?? this.templateKey,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<int>(weddingId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendorCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EventVendorCategoriesTable extends EventVendorCategories
    with TableInfo<$EventVendorCategoriesTable, EventVendorCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventVendorCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _vendorCategoryIdMeta = const VerificationMeta(
    'vendorCategoryId',
  );
  @override
  late final GeneratedColumn<int> vendorCategoryId = GeneratedColumn<int>(
    'vendor_category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vendor_categories (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventId, vendorCategoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_vendor_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventVendorCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('vendor_category_id')) {
      context.handle(
        _vendorCategoryIdMeta,
        vendorCategoryId.isAcceptableOrUnknown(
          data['vendor_category_id']!,
          _vendorCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vendorCategoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId, vendorCategoryId};
  @override
  EventVendorCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventVendorCategory(
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      )!,
      vendorCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vendor_category_id'],
      )!,
    );
  }

  @override
  $EventVendorCategoriesTable createAlias(String alias) {
    return $EventVendorCategoriesTable(attachedDatabase, alias);
  }
}

class EventVendorCategory extends DataClass
    implements Insertable<EventVendorCategory> {
  final int eventId;
  final int vendorCategoryId;
  const EventVendorCategory({
    required this.eventId,
    required this.vendorCategoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<int>(eventId);
    map['vendor_category_id'] = Variable<int>(vendorCategoryId);
    return map;
  }

  EventVendorCategoriesCompanion toCompanion(bool nullToAbsent) {
    return EventVendorCategoriesCompanion(
      eventId: Value(eventId),
      vendorCategoryId: Value(vendorCategoryId),
    );
  }

  factory EventVendorCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventVendorCategory(
      eventId: serializer.fromJson<int>(json['eventId']),
      vendorCategoryId: serializer.fromJson<int>(json['vendorCategoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventId': serializer.toJson<int>(eventId),
      'vendorCategoryId': serializer.toJson<int>(vendorCategoryId),
    };
  }

  EventVendorCategory copyWith({int? eventId, int? vendorCategoryId}) =>
      EventVendorCategory(
        eventId: eventId ?? this.eventId,
        vendorCategoryId: vendorCategoryId ?? this.vendorCategoryId,
      );
  EventVendorCategory copyWithCompanion(EventVendorCategoriesCompanion data) {
    return EventVendorCategory(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      vendorCategoryId: data.vendorCategoryId.present
          ? data.vendorCategoryId.value
          : this.vendorCategoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventVendorCategory(')
          ..write('eventId: $eventId, ')
          ..write('vendorCategoryId: $vendorCategoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(eventId, vendorCategoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventVendorCategory &&
          other.eventId == this.eventId &&
          other.vendorCategoryId == this.vendorCategoryId);
}

class EventVendorCategoriesCompanion
    extends UpdateCompanion<EventVendorCategory> {
  final Value<int> eventId;
  final Value<int> vendorCategoryId;
  final Value<int> rowid;
  const EventVendorCategoriesCompanion({
    this.eventId = const Value.absent(),
    this.vendorCategoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventVendorCategoriesCompanion.insert({
    required int eventId,
    required int vendorCategoryId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       vendorCategoryId = Value(vendorCategoryId);
  static Insertable<EventVendorCategory> custom({
    Expression<int>? eventId,
    Expression<int>? vendorCategoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (vendorCategoryId != null) 'vendor_category_id': vendorCategoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventVendorCategoriesCompanion copyWith({
    Value<int>? eventId,
    Value<int>? vendorCategoryId,
    Value<int>? rowid,
  }) {
    return EventVendorCategoriesCompanion(
      eventId: eventId ?? this.eventId,
      vendorCategoryId: vendorCategoryId ?? this.vendorCategoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    if (vendorCategoryId.present) {
      map['vendor_category_id'] = Variable<int>(vendorCategoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventVendorCategoriesCompanion(')
          ..write('eventId: $eventId, ')
          ..write('vendorCategoryId: $vendorCategoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VendorsTable extends Vendors with TableInfo<$VendorsTable, Vendor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _vendorCategoryIdMeta = const VerificationMeta(
    'vendorCategoryId',
  );
  @override
  late final GeneratedColumn<int> vendorCategoryId = GeneratedColumn<int>(
    'vendor_category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vendor_categories (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _advancePaidMeta = const VerificationMeta(
    'advancePaid',
  );
  @override
  late final GeneratedColumn<int> advancePaid = GeneratedColumn<int>(
    'advance_paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _bookingStatusMeta = const VerificationMeta(
    'bookingStatus',
  );
  @override
  late final GeneratedColumn<String> bookingStatus = GeneratedColumn<String>(
    'booking_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('not_contacted'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vendorCategoryId,
    name,
    contact,
    price,
    advancePaid,
    bookingStatus,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vendor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vendor_category_id')) {
      context.handle(
        _vendorCategoryIdMeta,
        vendorCategoryId.isAcceptableOrUnknown(
          data['vendor_category_id']!,
          _vendorCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vendorCategoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('advance_paid')) {
      context.handle(
        _advancePaidMeta,
        advancePaid.isAcceptableOrUnknown(
          data['advance_paid']!,
          _advancePaidMeta,
        ),
      );
    }
    if (data.containsKey('booking_status')) {
      context.handle(
        _bookingStatusMeta,
        bookingStatus.isAcceptableOrUnknown(
          data['booking_status']!,
          _bookingStatusMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vendor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vendor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      vendorCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vendor_category_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      advancePaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}advance_paid'],
      )!,
      bookingStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}booking_status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VendorsTable createAlias(String alias) {
    return $VendorsTable(attachedDatabase, alias);
  }
}

class Vendor extends DataClass implements Insertable<Vendor> {
  final int id;
  final int vendorCategoryId;
  final String name;
  final String? contact;
  final int price;
  final int advancePaid;
  final String bookingStatus;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Vendor({
    required this.id,
    required this.vendorCategoryId,
    required this.name,
    this.contact,
    required this.price,
    required this.advancePaid,
    required this.bookingStatus,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vendor_category_id'] = Variable<int>(vendorCategoryId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || contact != null) {
      map['contact'] = Variable<String>(contact);
    }
    map['price'] = Variable<int>(price);
    map['advance_paid'] = Variable<int>(advancePaid);
    map['booking_status'] = Variable<String>(bookingStatus);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VendorsCompanion toCompanion(bool nullToAbsent) {
    return VendorsCompanion(
      id: Value(id),
      vendorCategoryId: Value(vendorCategoryId),
      name: Value(name),
      contact: contact == null && nullToAbsent
          ? const Value.absent()
          : Value(contact),
      price: Value(price),
      advancePaid: Value(advancePaid),
      bookingStatus: Value(bookingStatus),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Vendor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vendor(
      id: serializer.fromJson<int>(json['id']),
      vendorCategoryId: serializer.fromJson<int>(json['vendorCategoryId']),
      name: serializer.fromJson<String>(json['name']),
      contact: serializer.fromJson<String?>(json['contact']),
      price: serializer.fromJson<int>(json['price']),
      advancePaid: serializer.fromJson<int>(json['advancePaid']),
      bookingStatus: serializer.fromJson<String>(json['bookingStatus']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vendorCategoryId': serializer.toJson<int>(vendorCategoryId),
      'name': serializer.toJson<String>(name),
      'contact': serializer.toJson<String?>(contact),
      'price': serializer.toJson<int>(price),
      'advancePaid': serializer.toJson<int>(advancePaid),
      'bookingStatus': serializer.toJson<String>(bookingStatus),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Vendor copyWith({
    int? id,
    int? vendorCategoryId,
    String? name,
    Value<String?> contact = const Value.absent(),
    int? price,
    int? advancePaid,
    String? bookingStatus,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Vendor(
    id: id ?? this.id,
    vendorCategoryId: vendorCategoryId ?? this.vendorCategoryId,
    name: name ?? this.name,
    contact: contact.present ? contact.value : this.contact,
    price: price ?? this.price,
    advancePaid: advancePaid ?? this.advancePaid,
    bookingStatus: bookingStatus ?? this.bookingStatus,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Vendor copyWithCompanion(VendorsCompanion data) {
    return Vendor(
      id: data.id.present ? data.id.value : this.id,
      vendorCategoryId: data.vendorCategoryId.present
          ? data.vendorCategoryId.value
          : this.vendorCategoryId,
      name: data.name.present ? data.name.value : this.name,
      contact: data.contact.present ? data.contact.value : this.contact,
      price: data.price.present ? data.price.value : this.price,
      advancePaid: data.advancePaid.present
          ? data.advancePaid.value
          : this.advancePaid,
      bookingStatus: data.bookingStatus.present
          ? data.bookingStatus.value
          : this.bookingStatus,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vendor(')
          ..write('id: $id, ')
          ..write('vendorCategoryId: $vendorCategoryId, ')
          ..write('name: $name, ')
          ..write('contact: $contact, ')
          ..write('price: $price, ')
          ..write('advancePaid: $advancePaid, ')
          ..write('bookingStatus: $bookingStatus, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vendorCategoryId,
    name,
    contact,
    price,
    advancePaid,
    bookingStatus,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vendor &&
          other.id == this.id &&
          other.vendorCategoryId == this.vendorCategoryId &&
          other.name == this.name &&
          other.contact == this.contact &&
          other.price == this.price &&
          other.advancePaid == this.advancePaid &&
          other.bookingStatus == this.bookingStatus &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VendorsCompanion extends UpdateCompanion<Vendor> {
  final Value<int> id;
  final Value<int> vendorCategoryId;
  final Value<String> name;
  final Value<String?> contact;
  final Value<int> price;
  final Value<int> advancePaid;
  final Value<String> bookingStatus;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const VendorsCompanion({
    this.id = const Value.absent(),
    this.vendorCategoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.contact = const Value.absent(),
    this.price = const Value.absent(),
    this.advancePaid = const Value.absent(),
    this.bookingStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  VendorsCompanion.insert({
    this.id = const Value.absent(),
    required int vendorCategoryId,
    required String name,
    this.contact = const Value.absent(),
    this.price = const Value.absent(),
    this.advancePaid = const Value.absent(),
    this.bookingStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : vendorCategoryId = Value(vendorCategoryId),
       name = Value(name);
  static Insertable<Vendor> custom({
    Expression<int>? id,
    Expression<int>? vendorCategoryId,
    Expression<String>? name,
    Expression<String>? contact,
    Expression<int>? price,
    Expression<int>? advancePaid,
    Expression<String>? bookingStatus,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vendorCategoryId != null) 'vendor_category_id': vendorCategoryId,
      if (name != null) 'name': name,
      if (contact != null) 'contact': contact,
      if (price != null) 'price': price,
      if (advancePaid != null) 'advance_paid': advancePaid,
      if (bookingStatus != null) 'booking_status': bookingStatus,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  VendorsCompanion copyWith({
    Value<int>? id,
    Value<int>? vendorCategoryId,
    Value<String>? name,
    Value<String?>? contact,
    Value<int>? price,
    Value<int>? advancePaid,
    Value<String>? bookingStatus,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return VendorsCompanion(
      id: id ?? this.id,
      vendorCategoryId: vendorCategoryId ?? this.vendorCategoryId,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      price: price ?? this.price,
      advancePaid: advancePaid ?? this.advancePaid,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vendorCategoryId.present) {
      map['vendor_category_id'] = Variable<int>(vendorCategoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (advancePaid.present) {
      map['advance_paid'] = Variable<int>(advancePaid.value);
    }
    if (bookingStatus.present) {
      map['booking_status'] = Variable<String>(bookingStatus.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendorsCompanion(')
          ..write('id: $id, ')
          ..write('vendorCategoryId: $vendorCategoryId, ')
          ..write('name: $name, ')
          ..write('contact: $contact, ')
          ..write('price: $price, ')
          ..write('advancePaid: $advancePaid, ')
          ..write('bookingStatus: $bookingStatus, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GuestsTable extends Guests with TableInfo<$GuestsTable, Guest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<int> weddingId = GeneratedColumn<int>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weddings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupNameMeta = const VerificationMeta(
    'groupName',
  );
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
    'group_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _peopleCountMeta = const VerificationMeta(
    'peopleCount',
  );
  @override
  late final GeneratedColumn<int> peopleCount = GeneratedColumn<int>(
    'people_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _rsvpMeta = const VerificationMeta('rsvp');
  @override
  late final GeneratedColumn<String> rsvp = GeneratedColumn<String>(
    'rsvp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    name,
    groupName,
    peopleCount,
    rsvp,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guests';
  @override
  VerificationContext validateIntegrity(
    Insertable<Guest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(
        _groupNameMeta,
        groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta),
      );
    }
    if (data.containsKey('people_count')) {
      context.handle(
        _peopleCountMeta,
        peopleCount.isAcceptableOrUnknown(
          data['people_count']!,
          _peopleCountMeta,
        ),
      );
    }
    if (data.containsKey('rsvp')) {
      context.handle(
        _rsvpMeta,
        rsvp.isAcceptableOrUnknown(data['rsvp']!, _rsvpMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Guest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Guest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wedding_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      groupName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group_name'],
      ),
      peopleCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}people_count'],
      )!,
      rsvp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rsvp'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GuestsTable createAlias(String alias) {
    return $GuestsTable(attachedDatabase, alias);
  }
}

class Guest extends DataClass implements Insertable<Guest> {
  final int id;
  final int weddingId;
  final String name;
  final String? groupName;
  final int peopleCount;
  final String rsvp;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Guest({
    required this.id,
    required this.weddingId,
    required this.name,
    this.groupName,
    required this.peopleCount,
    required this.rsvp,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wedding_id'] = Variable<int>(weddingId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || groupName != null) {
      map['group_name'] = Variable<String>(groupName);
    }
    map['people_count'] = Variable<int>(peopleCount);
    map['rsvp'] = Variable<String>(rsvp);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GuestsCompanion toCompanion(bool nullToAbsent) {
    return GuestsCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      name: Value(name),
      groupName: groupName == null && nullToAbsent
          ? const Value.absent()
          : Value(groupName),
      peopleCount: Value(peopleCount),
      rsvp: Value(rsvp),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Guest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Guest(
      id: serializer.fromJson<int>(json['id']),
      weddingId: serializer.fromJson<int>(json['weddingId']),
      name: serializer.fromJson<String>(json['name']),
      groupName: serializer.fromJson<String?>(json['groupName']),
      peopleCount: serializer.fromJson<int>(json['peopleCount']),
      rsvp: serializer.fromJson<String>(json['rsvp']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weddingId': serializer.toJson<int>(weddingId),
      'name': serializer.toJson<String>(name),
      'groupName': serializer.toJson<String?>(groupName),
      'peopleCount': serializer.toJson<int>(peopleCount),
      'rsvp': serializer.toJson<String>(rsvp),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Guest copyWith({
    int? id,
    int? weddingId,
    String? name,
    Value<String?> groupName = const Value.absent(),
    int? peopleCount,
    String? rsvp,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Guest(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    name: name ?? this.name,
    groupName: groupName.present ? groupName.value : this.groupName,
    peopleCount: peopleCount ?? this.peopleCount,
    rsvp: rsvp ?? this.rsvp,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Guest copyWithCompanion(GuestsCompanion data) {
    return Guest(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      name: data.name.present ? data.name.value : this.name,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      peopleCount: data.peopleCount.present
          ? data.peopleCount.value
          : this.peopleCount,
      rsvp: data.rsvp.present ? data.rsvp.value : this.rsvp,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Guest(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('groupName: $groupName, ')
          ..write('peopleCount: $peopleCount, ')
          ..write('rsvp: $rsvp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    name,
    groupName,
    peopleCount,
    rsvp,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Guest &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.name == this.name &&
          other.groupName == this.groupName &&
          other.peopleCount == this.peopleCount &&
          other.rsvp == this.rsvp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GuestsCompanion extends UpdateCompanion<Guest> {
  final Value<int> id;
  final Value<int> weddingId;
  final Value<String> name;
  final Value<String?> groupName;
  final Value<int> peopleCount;
  final Value<String> rsvp;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GuestsCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.name = const Value.absent(),
    this.groupName = const Value.absent(),
    this.peopleCount = const Value.absent(),
    this.rsvp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GuestsCompanion.insert({
    this.id = const Value.absent(),
    required int weddingId,
    required String name,
    this.groupName = const Value.absent(),
    this.peopleCount = const Value.absent(),
    this.rsvp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weddingId = Value(weddingId),
       name = Value(name);
  static Insertable<Guest> custom({
    Expression<int>? id,
    Expression<int>? weddingId,
    Expression<String>? name,
    Expression<String>? groupName,
    Expression<int>? peopleCount,
    Expression<String>? rsvp,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (name != null) 'name': name,
      if (groupName != null) 'group_name': groupName,
      if (peopleCount != null) 'people_count': peopleCount,
      if (rsvp != null) 'rsvp': rsvp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GuestsCompanion copyWith({
    Value<int>? id,
    Value<int>? weddingId,
    Value<String>? name,
    Value<String?>? groupName,
    Value<int>? peopleCount,
    Value<String>? rsvp,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return GuestsCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      groupName: groupName ?? this.groupName,
      peopleCount: peopleCount ?? this.peopleCount,
      rsvp: rsvp ?? this.rsvp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<int>(weddingId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (peopleCount.present) {
      map['people_count'] = Variable<int>(peopleCount.value);
    }
    if (rsvp.present) {
      map['rsvp'] = Variable<String>(rsvp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuestsCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('groupName: $groupName, ')
          ..write('peopleCount: $peopleCount, ')
          ..write('rsvp: $rsvp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GuestEventsTable extends GuestEvents
    with TableInfo<$GuestEventsTable, GuestEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuestEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _guestIdMeta = const VerificationMeta(
    'guestId',
  );
  @override
  late final GeneratedColumn<int> guestId = GeneratedColumn<int>(
    'guest_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES guests (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [guestId, eventId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guest_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuestEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guest_id')) {
      context.handle(
        _guestIdMeta,
        guestId.isAcceptableOrUnknown(data['guest_id']!, _guestIdMeta),
      );
    } else if (isInserting) {
      context.missing(_guestIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guestId, eventId};
  @override
  GuestEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuestEvent(
      guestId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guest_id'],
      )!,
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}event_id'],
      )!,
    );
  }

  @override
  $GuestEventsTable createAlias(String alias) {
    return $GuestEventsTable(attachedDatabase, alias);
  }
}

class GuestEvent extends DataClass implements Insertable<GuestEvent> {
  final int guestId;
  final int eventId;
  const GuestEvent({required this.guestId, required this.eventId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guest_id'] = Variable<int>(guestId);
    map['event_id'] = Variable<int>(eventId);
    return map;
  }

  GuestEventsCompanion toCompanion(bool nullToAbsent) {
    return GuestEventsCompanion(
      guestId: Value(guestId),
      eventId: Value(eventId),
    );
  }

  factory GuestEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuestEvent(
      guestId: serializer.fromJson<int>(json['guestId']),
      eventId: serializer.fromJson<int>(json['eventId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guestId': serializer.toJson<int>(guestId),
      'eventId': serializer.toJson<int>(eventId),
    };
  }

  GuestEvent copyWith({int? guestId, int? eventId}) => GuestEvent(
    guestId: guestId ?? this.guestId,
    eventId: eventId ?? this.eventId,
  );
  GuestEvent copyWithCompanion(GuestEventsCompanion data) {
    return GuestEvent(
      guestId: data.guestId.present ? data.guestId.value : this.guestId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuestEvent(')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(guestId, eventId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuestEvent &&
          other.guestId == this.guestId &&
          other.eventId == this.eventId);
}

class GuestEventsCompanion extends UpdateCompanion<GuestEvent> {
  final Value<int> guestId;
  final Value<int> eventId;
  final Value<int> rowid;
  const GuestEventsCompanion({
    this.guestId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GuestEventsCompanion.insert({
    required int guestId,
    required int eventId,
    this.rowid = const Value.absent(),
  }) : guestId = Value(guestId),
       eventId = Value(eventId);
  static Insertable<GuestEvent> custom({
    Expression<int>? guestId,
    Expression<int>? eventId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (guestId != null) 'guest_id': guestId,
      if (eventId != null) 'event_id': eventId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GuestEventsCompanion copyWith({
    Value<int>? guestId,
    Value<int>? eventId,
    Value<int>? rowid,
  }) {
    return GuestEventsCompanion(
      guestId: guestId ?? this.guestId,
      eventId: eventId ?? this.eventId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guestId.present) {
      map['guest_id'] = Variable<int>(guestId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuestEventsCompanion(')
          ..write('guestId: $guestId, ')
          ..write('eventId: $eventId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShoppingItemsTable extends ShoppingItems
    with TableInfo<$ShoppingItemsTable, ShoppingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<int> weddingId = GeneratedColumn<int>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weddings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('other'),
  );
  static const VerificationMeta _isPurchasedMeta = const VerificationMeta(
    'isPurchased',
  );
  @override
  late final GeneratedColumn<bool> isPurchased = GeneratedColumn<bool>(
    'is_purchased',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_purchased" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    name,
    category,
    isPurchased,
    source,
    templateKey,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShoppingItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('is_purchased')) {
      context.handle(
        _isPurchasedMeta,
        isPurchased.isAcceptableOrUnknown(
          data['is_purchased']!,
          _isPurchasedMeta,
        ),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wedding_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      isPurchased: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_purchased'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ShoppingItemsTable createAlias(String alias) {
    return $ShoppingItemsTable(attachedDatabase, alias);
  }
}

class ShoppingItem extends DataClass implements Insertable<ShoppingItem> {
  final int id;
  final int weddingId;
  final String name;
  final String category;
  final bool isPurchased;
  final String source;
  final String? templateKey;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ShoppingItem({
    required this.id,
    required this.weddingId,
    required this.name,
    required this.category,
    required this.isPurchased,
    required this.source,
    this.templateKey,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wedding_id'] = Variable<int>(weddingId);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['is_purchased'] = Variable<bool>(isPurchased);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || templateKey != null) {
      map['template_key'] = Variable<String>(templateKey);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ShoppingItemsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingItemsCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      name: Value(name),
      category: Value(category),
      isPurchased: Value(isPurchased),
      source: Value(source),
      templateKey: templateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(templateKey),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ShoppingItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingItem(
      id: serializer.fromJson<int>(json['id']),
      weddingId: serializer.fromJson<int>(json['weddingId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      isPurchased: serializer.fromJson<bool>(json['isPurchased']),
      source: serializer.fromJson<String>(json['source']),
      templateKey: serializer.fromJson<String?>(json['templateKey']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weddingId': serializer.toJson<int>(weddingId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'isPurchased': serializer.toJson<bool>(isPurchased),
      'source': serializer.toJson<String>(source),
      'templateKey': serializer.toJson<String?>(templateKey),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ShoppingItem copyWith({
    int? id,
    int? weddingId,
    String? name,
    String? category,
    bool? isPurchased,
    String? source,
    Value<String?> templateKey = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ShoppingItem(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    name: name ?? this.name,
    category: category ?? this.category,
    isPurchased: isPurchased ?? this.isPurchased,
    source: source ?? this.source,
    templateKey: templateKey.present ? templateKey.value : this.templateKey,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ShoppingItem copyWithCompanion(ShoppingItemsCompanion data) {
    return ShoppingItem(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      isPurchased: data.isPurchased.present
          ? data.isPurchased.value
          : this.isPurchased,
      source: data.source.present ? data.source.value : this.source,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingItem(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('isPurchased: $isPurchased, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    name,
    category,
    isPurchased,
    source,
    templateKey,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingItem &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.name == this.name &&
          other.category == this.category &&
          other.isPurchased == this.isPurchased &&
          other.source == this.source &&
          other.templateKey == this.templateKey &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ShoppingItemsCompanion extends UpdateCompanion<ShoppingItem> {
  final Value<int> id;
  final Value<int> weddingId;
  final Value<String> name;
  final Value<String> category;
  final Value<bool> isPurchased;
  final Value<String> source;
  final Value<String?> templateKey;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ShoppingItemsCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.isPurchased = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ShoppingItemsCompanion.insert({
    this.id = const Value.absent(),
    required int weddingId,
    required String name,
    this.category = const Value.absent(),
    this.isPurchased = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weddingId = Value(weddingId),
       name = Value(name);
  static Insertable<ShoppingItem> custom({
    Expression<int>? id,
    Expression<int>? weddingId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<bool>? isPurchased,
    Expression<String>? source,
    Expression<String>? templateKey,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (isPurchased != null) 'is_purchased': isPurchased,
      if (source != null) 'source': source,
      if (templateKey != null) 'template_key': templateKey,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ShoppingItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? weddingId,
    Value<String>? name,
    Value<String>? category,
    Value<bool>? isPurchased,
    Value<String>? source,
    Value<String?>? templateKey,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ShoppingItemsCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      category: category ?? this.category,
      isPurchased: isPurchased ?? this.isPurchased,
      source: source ?? this.source,
      templateKey: templateKey ?? this.templateKey,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<int>(weddingId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isPurchased.present) {
      map['is_purchased'] = Variable<bool>(isPurchased.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingItemsCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('isPurchased: $isPurchased, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BudgetItemsTable extends BudgetItems
    with TableInfo<$BudgetItemsTable, BudgetItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weddingIdMeta = const VerificationMeta(
    'weddingId',
  );
  @override
  late final GeneratedColumn<int> weddingId = GeneratedColumn<int>(
    'wedding_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weddings (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedMeta = const VerificationMeta(
    'estimated',
  );
  @override
  late final GeneratedColumn<int> estimated = GeneratedColumn<int>(
    'estimated',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _actualMeta = const VerificationMeta('actual');
  @override
  late final GeneratedColumn<int> actual = GeneratedColumn<int>(
    'actual',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('user'),
  );
  static const VerificationMeta _templateKeyMeta = const VerificationMeta(
    'templateKey',
  );
  @override
  late final GeneratedColumn<String> templateKey = GeneratedColumn<String>(
    'template_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weddingId,
    categoryName,
    estimated,
    actual,
    notes,
    source,
    templateKey,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<BudgetItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wedding_id')) {
      context.handle(
        _weddingIdMeta,
        weddingId.isAcceptableOrUnknown(data['wedding_id']!, _weddingIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weddingIdMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('estimated')) {
      context.handle(
        _estimatedMeta,
        estimated.isAcceptableOrUnknown(data['estimated']!, _estimatedMeta),
      );
    }
    if (data.containsKey('actual')) {
      context.handle(
        _actualMeta,
        actual.isAcceptableOrUnknown(data['actual']!, _actualMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('template_key')) {
      context.handle(
        _templateKeyMeta,
        templateKey.isAcceptableOrUnknown(
          data['template_key']!,
          _templateKeyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weddingId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wedding_id'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
      estimated: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated'],
      )!,
      actual: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}actual'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      templateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_key'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BudgetItemsTable createAlias(String alias) {
    return $BudgetItemsTable(attachedDatabase, alias);
  }
}

class BudgetItem extends DataClass implements Insertable<BudgetItem> {
  final int id;
  final int weddingId;
  final String categoryName;
  final int estimated;
  final int actual;
  final String? notes;
  final String source;
  final String? templateKey;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BudgetItem({
    required this.id,
    required this.weddingId,
    required this.categoryName,
    required this.estimated,
    required this.actual,
    this.notes,
    required this.source,
    this.templateKey,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wedding_id'] = Variable<int>(weddingId);
    map['category_name'] = Variable<String>(categoryName);
    map['estimated'] = Variable<int>(estimated);
    map['actual'] = Variable<int>(actual);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || templateKey != null) {
      map['template_key'] = Variable<String>(templateKey);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BudgetItemsCompanion toCompanion(bool nullToAbsent) {
    return BudgetItemsCompanion(
      id: Value(id),
      weddingId: Value(weddingId),
      categoryName: Value(categoryName),
      estimated: Value(estimated),
      actual: Value(actual),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      source: Value(source),
      templateKey: templateKey == null && nullToAbsent
          ? const Value.absent()
          : Value(templateKey),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BudgetItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetItem(
      id: serializer.fromJson<int>(json['id']),
      weddingId: serializer.fromJson<int>(json['weddingId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      estimated: serializer.fromJson<int>(json['estimated']),
      actual: serializer.fromJson<int>(json['actual']),
      notes: serializer.fromJson<String?>(json['notes']),
      source: serializer.fromJson<String>(json['source']),
      templateKey: serializer.fromJson<String?>(json['templateKey']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weddingId': serializer.toJson<int>(weddingId),
      'categoryName': serializer.toJson<String>(categoryName),
      'estimated': serializer.toJson<int>(estimated),
      'actual': serializer.toJson<int>(actual),
      'notes': serializer.toJson<String?>(notes),
      'source': serializer.toJson<String>(source),
      'templateKey': serializer.toJson<String?>(templateKey),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BudgetItem copyWith({
    int? id,
    int? weddingId,
    String? categoryName,
    int? estimated,
    int? actual,
    Value<String?> notes = const Value.absent(),
    String? source,
    Value<String?> templateKey = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BudgetItem(
    id: id ?? this.id,
    weddingId: weddingId ?? this.weddingId,
    categoryName: categoryName ?? this.categoryName,
    estimated: estimated ?? this.estimated,
    actual: actual ?? this.actual,
    notes: notes.present ? notes.value : this.notes,
    source: source ?? this.source,
    templateKey: templateKey.present ? templateKey.value : this.templateKey,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BudgetItem copyWithCompanion(BudgetItemsCompanion data) {
    return BudgetItem(
      id: data.id.present ? data.id.value : this.id,
      weddingId: data.weddingId.present ? data.weddingId.value : this.weddingId,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      estimated: data.estimated.present ? data.estimated.value : this.estimated,
      actual: data.actual.present ? data.actual.value : this.actual,
      notes: data.notes.present ? data.notes.value : this.notes,
      source: data.source.present ? data.source.value : this.source,
      templateKey: data.templateKey.present
          ? data.templateKey.value
          : this.templateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetItem(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('categoryName: $categoryName, ')
          ..write('estimated: $estimated, ')
          ..write('actual: $actual, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weddingId,
    categoryName,
    estimated,
    actual,
    notes,
    source,
    templateKey,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetItem &&
          other.id == this.id &&
          other.weddingId == this.weddingId &&
          other.categoryName == this.categoryName &&
          other.estimated == this.estimated &&
          other.actual == this.actual &&
          other.notes == this.notes &&
          other.source == this.source &&
          other.templateKey == this.templateKey &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BudgetItemsCompanion extends UpdateCompanion<BudgetItem> {
  final Value<int> id;
  final Value<int> weddingId;
  final Value<String> categoryName;
  final Value<int> estimated;
  final Value<int> actual;
  final Value<String?> notes;
  final Value<String> source;
  final Value<String?> templateKey;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BudgetItemsCompanion({
    this.id = const Value.absent(),
    this.weddingId = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.estimated = const Value.absent(),
    this.actual = const Value.absent(),
    this.notes = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BudgetItemsCompanion.insert({
    this.id = const Value.absent(),
    required int weddingId,
    required String categoryName,
    this.estimated = const Value.absent(),
    this.actual = const Value.absent(),
    this.notes = const Value.absent(),
    this.source = const Value.absent(),
    this.templateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : weddingId = Value(weddingId),
       categoryName = Value(categoryName);
  static Insertable<BudgetItem> custom({
    Expression<int>? id,
    Expression<int>? weddingId,
    Expression<String>? categoryName,
    Expression<int>? estimated,
    Expression<int>? actual,
    Expression<String>? notes,
    Expression<String>? source,
    Expression<String>? templateKey,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weddingId != null) 'wedding_id': weddingId,
      if (categoryName != null) 'category_name': categoryName,
      if (estimated != null) 'estimated': estimated,
      if (actual != null) 'actual': actual,
      if (notes != null) 'notes': notes,
      if (source != null) 'source': source,
      if (templateKey != null) 'template_key': templateKey,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BudgetItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? weddingId,
    Value<String>? categoryName,
    Value<int>? estimated,
    Value<int>? actual,
    Value<String?>? notes,
    Value<String>? source,
    Value<String?>? templateKey,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return BudgetItemsCompanion(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      categoryName: categoryName ?? this.categoryName,
      estimated: estimated ?? this.estimated,
      actual: actual ?? this.actual,
      notes: notes ?? this.notes,
      source: source ?? this.source,
      templateKey: templateKey ?? this.templateKey,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weddingId.present) {
      map['wedding_id'] = Variable<int>(weddingId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (estimated.present) {
      map['estimated'] = Variable<int>(estimated.value);
    }
    if (actual.present) {
      map['actual'] = Variable<int>(actual.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (templateKey.present) {
      map['template_key'] = Variable<String>(templateKey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetItemsCompanion(')
          ..write('id: $id, ')
          ..write('weddingId: $weddingId, ')
          ..write('categoryName: $categoryName, ')
          ..write('estimated: $estimated, ')
          ..write('actual: $actual, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('templateKey: $templateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $WaitlistInterestsTable extends WaitlistInterests
    with TableInfo<$WaitlistInterestsTable, WaitlistInterest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaitlistInterestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  @override
  List<GeneratedColumn> get $columns => [id, city, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'waitlist_interests';
  @override
  VerificationContext validateIntegrity(
    Insertable<WaitlistInterest> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaitlistInterest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaitlistInterest(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WaitlistInterestsTable createAlias(String alias) {
    return $WaitlistInterestsTable(attachedDatabase, alias);
  }
}

class WaitlistInterest extends DataClass
    implements Insertable<WaitlistInterest> {
  final int id;
  final String city;
  final DateTime createdAt;
  const WaitlistInterest({
    required this.id,
    required this.city,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['city'] = Variable<String>(city);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WaitlistInterestsCompanion toCompanion(bool nullToAbsent) {
    return WaitlistInterestsCompanion(
      id: Value(id),
      city: Value(city),
      createdAt: Value(createdAt),
    );
  }

  factory WaitlistInterest.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaitlistInterest(
      id: serializer.fromJson<int>(json['id']),
      city: serializer.fromJson<String>(json['city']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'city': serializer.toJson<String>(city),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WaitlistInterest copyWith({int? id, String? city, DateTime? createdAt}) =>
      WaitlistInterest(
        id: id ?? this.id,
        city: city ?? this.city,
        createdAt: createdAt ?? this.createdAt,
      );
  WaitlistInterest copyWithCompanion(WaitlistInterestsCompanion data) {
    return WaitlistInterest(
      id: data.id.present ? data.id.value : this.id,
      city: data.city.present ? data.city.value : this.city,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaitlistInterest(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, city, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaitlistInterest &&
          other.id == this.id &&
          other.city == this.city &&
          other.createdAt == this.createdAt);
}

class WaitlistInterestsCompanion extends UpdateCompanion<WaitlistInterest> {
  final Value<int> id;
  final Value<String> city;
  final Value<DateTime> createdAt;
  const WaitlistInterestsCompanion({
    this.id = const Value.absent(),
    this.city = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  WaitlistInterestsCompanion.insert({
    this.id = const Value.absent(),
    required String city,
    this.createdAt = const Value.absent(),
  }) : city = Value(city);
  static Insertable<WaitlistInterest> custom({
    Expression<int>? id,
    Expression<String>? city,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (city != null) 'city': city,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  WaitlistInterestsCompanion copyWith({
    Value<int>? id,
    Value<String>? city,
    Value<DateTime>? createdAt,
  }) {
    return WaitlistInterestsCompanion(
      id: id ?? this.id,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaitlistInterestsCompanion(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WeddingsTable weddings = $WeddingsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $ChecklistItemsTable checklistItems = $ChecklistItemsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $VendorCategoriesTable vendorCategories = $VendorCategoriesTable(
    this,
  );
  late final $EventVendorCategoriesTable eventVendorCategories =
      $EventVendorCategoriesTable(this);
  late final $VendorsTable vendors = $VendorsTable(this);
  late final $GuestsTable guests = $GuestsTable(this);
  late final $GuestEventsTable guestEvents = $GuestEventsTable(this);
  late final $ShoppingItemsTable shoppingItems = $ShoppingItemsTable(this);
  late final $BudgetItemsTable budgetItems = $BudgetItemsTable(this);
  late final $WaitlistInterestsTable waitlistInterests =
      $WaitlistInterestsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    weddings,
    events,
    checklistItems,
    tasks,
    vendorCategories,
    eventVendorCategories,
    vendors,
    guests,
    guestEvents,
    shoppingItems,
    budgetItems,
    waitlistInterests,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weddings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('checklist_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weddings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tasks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tasks', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weddings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vendor_categories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_vendor_categories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vendor_categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_vendor_categories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vendor_categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vendors', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weddings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('guests', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'guests',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('guest_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('guest_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weddings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shopping_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'weddings',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('budget_items', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$WeddingsTableCreateCompanionBuilder =
    WeddingsCompanion Function({
      Value<int> id,
      required String name,
      required DateTime weddingDate,
      required String city,
      required int guestCount,
      required int totalBudget,
      Value<bool> planGenerated,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$WeddingsTableUpdateCompanionBuilder =
    WeddingsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> weddingDate,
      Value<String> city,
      Value<int> guestCount,
      Value<int> totalBudget,
      Value<bool> planGenerated,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$WeddingsTableReferences
    extends BaseReferences<_$AppDatabase, $WeddingsTable, Wedding> {
  $$WeddingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.events,
    aliasName: $_aliasNameGenerator(db.weddings.id, db.events.weddingId),
  );

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.weddingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.weddings.id, db.tasks.weddingId),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.weddingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VendorCategoriesTable, List<VendorCategory>>
  _vendorCategoriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vendorCategories,
    aliasName: $_aliasNameGenerator(
      db.weddings.id,
      db.vendorCategories.weddingId,
    ),
  );

  $$VendorCategoriesTableProcessedTableManager get vendorCategoriesRefs {
    final manager = $$VendorCategoriesTableTableManager(
      $_db,
      $_db.vendorCategories,
    ).filter((f) => f.weddingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _vendorCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GuestsTable, List<Guest>> _guestsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.guests,
    aliasName: $_aliasNameGenerator(db.weddings.id, db.guests.weddingId),
  );

  $$GuestsTableProcessedTableManager get guestsRefs {
    final manager = $$GuestsTableTableManager(
      $_db,
      $_db.guests,
    ).filter((f) => f.weddingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_guestsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShoppingItemsTable, List<ShoppingItem>>
  _shoppingItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shoppingItems,
    aliasName: $_aliasNameGenerator(db.weddings.id, db.shoppingItems.weddingId),
  );

  $$ShoppingItemsTableProcessedTableManager get shoppingItemsRefs {
    final manager = $$ShoppingItemsTableTableManager(
      $_db,
      $_db.shoppingItems,
    ).filter((f) => f.weddingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_shoppingItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BudgetItemsTable, List<BudgetItem>>
  _budgetItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.budgetItems,
    aliasName: $_aliasNameGenerator(db.weddings.id, db.budgetItems.weddingId),
  );

  $$BudgetItemsTableProcessedTableManager get budgetItemsRefs {
    final manager = $$BudgetItemsTableTableManager(
      $_db,
      $_db.budgetItems,
    ).filter((f) => f.weddingId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_budgetItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WeddingsTableFilterComposer
    extends Composer<_$AppDatabase, $WeddingsTable> {
  $$WeddingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weddingDate => $composableBuilder(
    column: $table.weddingDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalBudget => $composableBuilder(
    column: $table.totalBudget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get planGenerated => $composableBuilder(
    column: $table.planGenerated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventsRefs(
    Expression<bool> Function($$EventsTableFilterComposer f) f,
  ) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vendorCategoriesRefs(
    Expression<bool> Function($$VendorCategoriesTableFilterComposer f) f,
  ) {
    final $$VendorCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guestsRefs(
    Expression<bool> Function($$GuestsTableFilterComposer f) f,
  ) {
    final $$GuestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guests,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestsTableFilterComposer(
            $db: $db,
            $table: $db.guests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shoppingItemsRefs(
    Expression<bool> Function($$ShoppingItemsTableFilterComposer f) f,
  ) {
    final $$ShoppingItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shoppingItems,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingItemsTableFilterComposer(
            $db: $db,
            $table: $db.shoppingItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> budgetItemsRefs(
    Expression<bool> Function($$BudgetItemsTableFilterComposer f) f,
  ) {
    final $$BudgetItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgetItems,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetItemsTableFilterComposer(
            $db: $db,
            $table: $db.budgetItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeddingsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeddingsTable> {
  $$WeddingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weddingDate => $composableBuilder(
    column: $table.weddingDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalBudget => $composableBuilder(
    column: $table.totalBudget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get planGenerated => $composableBuilder(
    column: $table.planGenerated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeddingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeddingsTable> {
  $$WeddingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get weddingDate => $composableBuilder(
    column: $table.weddingDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<int> get guestCount => $composableBuilder(
    column: $table.guestCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalBudget => $composableBuilder(
    column: $table.totalBudget,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get planGenerated => $composableBuilder(
    column: $table.planGenerated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> eventsRefs<T extends Object>(
    Expression<T> Function($$EventsTableAnnotationComposer a) f,
  ) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vendorCategoriesRefs<T extends Object>(
    Expression<T> Function($$VendorCategoriesTableAnnotationComposer a) f,
  ) {
    final $$VendorCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> guestsRefs<T extends Object>(
    Expression<T> Function($$GuestsTableAnnotationComposer a) f,
  ) {
    final $$GuestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guests,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestsTableAnnotationComposer(
            $db: $db,
            $table: $db.guests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shoppingItemsRefs<T extends Object>(
    Expression<T> Function($$ShoppingItemsTableAnnotationComposer a) f,
  ) {
    final $$ShoppingItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shoppingItems,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.shoppingItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> budgetItemsRefs<T extends Object>(
    Expression<T> Function($$BudgetItemsTableAnnotationComposer a) f,
  ) {
    final $$BudgetItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgetItems,
      getReferencedColumn: (t) => t.weddingId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BudgetItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.budgetItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeddingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeddingsTable,
          Wedding,
          $$WeddingsTableFilterComposer,
          $$WeddingsTableOrderingComposer,
          $$WeddingsTableAnnotationComposer,
          $$WeddingsTableCreateCompanionBuilder,
          $$WeddingsTableUpdateCompanionBuilder,
          (Wedding, $$WeddingsTableReferences),
          Wedding,
          PrefetchHooks Function({
            bool eventsRefs,
            bool tasksRefs,
            bool vendorCategoriesRefs,
            bool guestsRefs,
            bool shoppingItemsRefs,
            bool budgetItemsRefs,
          })
        > {
  $$WeddingsTableTableManager(_$AppDatabase db, $WeddingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeddingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeddingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeddingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> weddingDate = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<int> guestCount = const Value.absent(),
                Value<int> totalBudget = const Value.absent(),
                Value<bool> planGenerated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WeddingsCompanion(
                id: id,
                name: name,
                weddingDate: weddingDate,
                city: city,
                guestCount: guestCount,
                totalBudget: totalBudget,
                planGenerated: planGenerated,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime weddingDate,
                required String city,
                required int guestCount,
                required int totalBudget,
                Value<bool> planGenerated = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => WeddingsCompanion.insert(
                id: id,
                name: name,
                weddingDate: weddingDate,
                city: city,
                guestCount: guestCount,
                totalBudget: totalBudget,
                planGenerated: planGenerated,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeddingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                eventsRefs = false,
                tasksRefs = false,
                vendorCategoriesRefs = false,
                guestsRefs = false,
                shoppingItemsRefs = false,
                budgetItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventsRefs) db.events,
                    if (tasksRefs) db.tasks,
                    if (vendorCategoriesRefs) db.vendorCategories,
                    if (guestsRefs) db.guests,
                    if (shoppingItemsRefs) db.shoppingItems,
                    if (budgetItemsRefs) db.budgetItems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventsRefs)
                        await $_getPrefetchedData<
                          Wedding,
                          $WeddingsTable,
                          Event
                        >(
                          currentTable: table,
                          referencedTable: $$WeddingsTableReferences
                              ._eventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeddingsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weddingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tasksRefs)
                        await $_getPrefetchedData<
                          Wedding,
                          $WeddingsTable,
                          Task
                        >(
                          currentTable: table,
                          referencedTable: $$WeddingsTableReferences
                              ._tasksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeddingsTableReferences(
                                db,
                                table,
                                p0,
                              ).tasksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weddingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vendorCategoriesRefs)
                        await $_getPrefetchedData<
                          Wedding,
                          $WeddingsTable,
                          VendorCategory
                        >(
                          currentTable: table,
                          referencedTable: $$WeddingsTableReferences
                              ._vendorCategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeddingsTableReferences(
                                db,
                                table,
                                p0,
                              ).vendorCategoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weddingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guestsRefs)
                        await $_getPrefetchedData<
                          Wedding,
                          $WeddingsTable,
                          Guest
                        >(
                          currentTable: table,
                          referencedTable: $$WeddingsTableReferences
                              ._guestsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeddingsTableReferences(
                                db,
                                table,
                                p0,
                              ).guestsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weddingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shoppingItemsRefs)
                        await $_getPrefetchedData<
                          Wedding,
                          $WeddingsTable,
                          ShoppingItem
                        >(
                          currentTable: table,
                          referencedTable: $$WeddingsTableReferences
                              ._shoppingItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeddingsTableReferences(
                                db,
                                table,
                                p0,
                              ).shoppingItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weddingId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (budgetItemsRefs)
                        await $_getPrefetchedData<
                          Wedding,
                          $WeddingsTable,
                          BudgetItem
                        >(
                          currentTable: table,
                          referencedTable: $$WeddingsTableReferences
                              ._budgetItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WeddingsTableReferences(
                                db,
                                table,
                                p0,
                              ).budgetItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.weddingId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WeddingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeddingsTable,
      Wedding,
      $$WeddingsTableFilterComposer,
      $$WeddingsTableOrderingComposer,
      $$WeddingsTableAnnotationComposer,
      $$WeddingsTableCreateCompanionBuilder,
      $$WeddingsTableUpdateCompanionBuilder,
      (Wedding, $$WeddingsTableReferences),
      Wedding,
      PrefetchHooks Function({
        bool eventsRefs,
        bool tasksRefs,
        bool vendorCategoriesRefs,
        bool guestsRefs,
        bool shoppingItemsRefs,
        bool budgetItemsRefs,
      })
    >;
typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      Value<int> id,
      required int weddingId,
      required String name,
      Value<String?> templateKey,
      Value<bool> isCustom,
      Value<bool> isArchived,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      Value<int> id,
      Value<int> weddingId,
      Value<String> name,
      Value<String?> templateKey,
      Value<bool> isCustom,
      Value<bool> isArchived,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$EventsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WeddingsTable _weddingIdTable(_$AppDatabase db) => db.weddings
      .createAlias($_aliasNameGenerator(db.events.weddingId, db.weddings.id));

  $$WeddingsTableProcessedTableManager get weddingId {
    final $_column = $_itemColumn<int>('wedding_id')!;

    final manager = $$WeddingsTableTableManager(
      $_db,
      $_db.weddings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weddingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChecklistItemsTable, List<ChecklistItem>>
  _checklistItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.checklistItems,
    aliasName: $_aliasNameGenerator(db.events.id, db.checklistItems.eventId),
  );

  $$ChecklistItemsTableProcessedTableManager get checklistItemsRefs {
    final manager = $$ChecklistItemsTableTableManager(
      $_db,
      $_db.checklistItems,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_checklistItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.events.id, db.tasks.eventId),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EventVendorCategoriesTable,
    List<EventVendorCategory>
  >
  _eventVendorCategoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.eventVendorCategories,
        aliasName: $_aliasNameGenerator(
          db.events.id,
          db.eventVendorCategories.eventId,
        ),
      );

  $$EventVendorCategoriesTableProcessedTableManager
  get eventVendorCategoriesRefs {
    final manager = $$EventVendorCategoriesTableTableManager(
      $_db,
      $_db.eventVendorCategories,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventVendorCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GuestEventsTable, List<GuestEvent>>
  _guestEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.guestEvents,
    aliasName: $_aliasNameGenerator(db.events.id, db.guestEvents.eventId),
  );

  $$GuestEventsTableProcessedTableManager get guestEventsRefs {
    final manager = $$GuestEventsTableTableManager(
      $_db,
      $_db.guestEvents,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_guestEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeddingsTableFilterComposer get weddingId {
    final $$WeddingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableFilterComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> checklistItemsRefs(
    Expression<bool> Function($$ChecklistItemsTableFilterComposer f) f,
  ) {
    final $$ChecklistItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistItems,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistItemsTableFilterComposer(
            $db: $db,
            $table: $db.checklistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventVendorCategoriesRefs(
    Expression<bool> Function($$EventVendorCategoriesTableFilterComposer f) f,
  ) {
    final $$EventVendorCategoriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.eventVendorCategories,
          getReferencedColumn: (t) => t.eventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventVendorCategoriesTableFilterComposer(
                $db: $db,
                $table: $db.eventVendorCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> guestEventsRefs(
    Expression<bool> Function($$GuestEventsTableFilterComposer f) f,
  ) {
    final $$GuestEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestEvents,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestEventsTableFilterComposer(
            $db: $db,
            $table: $db.guestEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeddingsTableOrderingComposer get weddingId {
    final $$WeddingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableOrderingComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeddingsTableAnnotationComposer get weddingId {
    final $$WeddingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableAnnotationComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> checklistItemsRefs<T extends Object>(
    Expression<T> Function($$ChecklistItemsTableAnnotationComposer a) f,
  ) {
    final $$ChecklistItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistItems,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.checklistItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> eventVendorCategoriesRefs<T extends Object>(
    Expression<T> Function($$EventVendorCategoriesTableAnnotationComposer a) f,
  ) {
    final $$EventVendorCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.eventVendorCategories,
          getReferencedColumn: (t) => t.eventId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventVendorCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.eventVendorCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> guestEventsRefs<T extends Object>(
    Expression<T> Function($$GuestEventsTableAnnotationComposer a) f,
  ) {
    final $$GuestEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestEvents,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.guestEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTable,
          Event,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (Event, $$EventsTableReferences),
          Event,
          PrefetchHooks Function({
            bool weddingId,
            bool checklistItemsRefs,
            bool tasksRefs,
            bool eventVendorCategoriesRefs,
            bool guestEventsRefs,
          })
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weddingId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                weddingId: weddingId,
                name: name,
                templateKey: templateKey,
                isCustom: isCustom,
                isArchived: isArchived,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weddingId,
                required String name,
                Value<String?> templateKey = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                weddingId: weddingId,
                name: name,
                templateKey: templateKey,
                isCustom: isCustom,
                isArchived: isArchived,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$EventsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                weddingId = false,
                checklistItemsRefs = false,
                tasksRefs = false,
                eventVendorCategoriesRefs = false,
                guestEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (checklistItemsRefs) db.checklistItems,
                    if (tasksRefs) db.tasks,
                    if (eventVendorCategoriesRefs) db.eventVendorCategories,
                    if (guestEventsRefs) db.guestEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (weddingId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.weddingId,
                                    referencedTable: $$EventsTableReferences
                                        ._weddingIdTable(db),
                                    referencedColumn: $$EventsTableReferences
                                        ._weddingIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (checklistItemsRefs)
                        await $_getPrefetchedData<
                          Event,
                          $EventsTable,
                          ChecklistItem
                        >(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._checklistItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).checklistItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tasksRefs)
                        await $_getPrefetchedData<Event, $EventsTable, Task>(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._tasksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(db, table, p0).tasksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (eventVendorCategoriesRefs)
                        await $_getPrefetchedData<
                          Event,
                          $EventsTable,
                          EventVendorCategory
                        >(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._eventVendorCategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventVendorCategoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guestEventsRefs)
                        await $_getPrefetchedData<
                          Event,
                          $EventsTable,
                          GuestEvent
                        >(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._guestEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).guestEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTable,
      Event,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (Event, $$EventsTableReferences),
      Event,
      PrefetchHooks Function({
        bool weddingId,
        bool checklistItemsRefs,
        bool tasksRefs,
        bool eventVendorCategoriesRefs,
        bool guestEventsRefs,
      })
    >;
typedef $$ChecklistItemsTableCreateCompanionBuilder =
    ChecklistItemsCompanion Function({
      Value<int> id,
      required int eventId,
      required String title,
      Value<bool> isDone,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ChecklistItemsTableUpdateCompanionBuilder =
    ChecklistItemsCompanion Function({
      Value<int> id,
      Value<int> eventId,
      Value<String> title,
      Value<bool> isDone,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ChecklistItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem> {
  $$ChecklistItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.checklistItems.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<int>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChecklistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChecklistItemsTable,
          ChecklistItem,
          $$ChecklistItemsTableFilterComposer,
          $$ChecklistItemsTableOrderingComposer,
          $$ChecklistItemsTableAnnotationComposer,
          $$ChecklistItemsTableCreateCompanionBuilder,
          $$ChecklistItemsTableUpdateCompanionBuilder,
          (ChecklistItem, $$ChecklistItemsTableReferences),
          ChecklistItem,
          PrefetchHooks Function({bool eventId})
        > {
  $$ChecklistItemsTableTableManager(
    _$AppDatabase db,
    $ChecklistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChecklistItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> eventId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ChecklistItemsCompanion(
                id: id,
                eventId: eventId,
                title: title,
                isDone: isDone,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int eventId,
                required String title,
                Value<bool> isDone = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ChecklistItemsCompanion.insert(
                id: id,
                eventId: eventId,
                title: title,
                isDone: isDone,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChecklistItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable: $$ChecklistItemsTableReferences
                                    ._eventIdTable(db),
                                referencedColumn:
                                    $$ChecklistItemsTableReferences
                                        ._eventIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChecklistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChecklistItemsTable,
      ChecklistItem,
      $$ChecklistItemsTableFilterComposer,
      $$ChecklistItemsTableOrderingComposer,
      $$ChecklistItemsTableAnnotationComposer,
      $$ChecklistItemsTableCreateCompanionBuilder,
      $$ChecklistItemsTableUpdateCompanionBuilder,
      (ChecklistItem, $$ChecklistItemsTableReferences),
      ChecklistItem,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required int weddingId,
      Value<int?> eventId,
      required String name,
      Value<DateTime?> dueDate,
      Value<String?> assignee,
      Value<String> status,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<int> weddingId,
      Value<int?> eventId,
      Value<String> name,
      Value<DateTime?> dueDate,
      Value<String?> assignee,
      Value<String> status,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WeddingsTable _weddingIdTable(_$AppDatabase db) => db.weddings
      .createAlias($_aliasNameGenerator(db.tasks.weddingId, db.weddings.id));

  $$WeddingsTableProcessedTableManager get weddingId {
    final $_column = $_itemColumn<int>('wedding_id')!;

    final manager = $$WeddingsTableTableManager(
      $_db,
      $_db.weddings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weddingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.tasks.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager? get eventId {
    final $_column = $_itemColumn<int>('event_id');
    if ($_column == null) return null;
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assignee => $composableBuilder(
    column: $table.assignee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeddingsTableFilterComposer get weddingId {
    final $$WeddingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableFilterComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assignee => $composableBuilder(
    column: $table.assignee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeddingsTableOrderingComposer get weddingId {
    final $$WeddingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableOrderingComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get assignee =>
      $composableBuilder(column: $table.assignee, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeddingsTableAnnotationComposer get weddingId {
    final $$WeddingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableAnnotationComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({bool weddingId, bool eventId})
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weddingId = const Value.absent(),
                Value<int?> eventId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String?> assignee = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                weddingId: weddingId,
                eventId: eventId,
                name: name,
                dueDate: dueDate,
                assignee: assignee,
                status: status,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weddingId,
                Value<int?> eventId = const Value.absent(),
                required String name,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String?> assignee = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                weddingId: weddingId,
                eventId: eventId,
                name: name,
                dueDate: dueDate,
                assignee: assignee,
                status: status,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TasksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({weddingId = false, eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (weddingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.weddingId,
                                referencedTable: $$TasksTableReferences
                                    ._weddingIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._weddingIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable: $$TasksTableReferences
                                    ._eventIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._eventIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({bool weddingId, bool eventId})
    >;
typedef $$VendorCategoriesTableCreateCompanionBuilder =
    VendorCategoriesCompanion Function({
      Value<int> id,
      required int weddingId,
      required String name,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VendorCategoriesTableUpdateCompanionBuilder =
    VendorCategoriesCompanion Function({
      Value<int> id,
      Value<int> weddingId,
      Value<String> name,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VendorCategoriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $VendorCategoriesTable, VendorCategory> {
  $$VendorCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WeddingsTable _weddingIdTable(_$AppDatabase db) =>
      db.weddings.createAlias(
        $_aliasNameGenerator(db.vendorCategories.weddingId, db.weddings.id),
      );

  $$WeddingsTableProcessedTableManager get weddingId {
    final $_column = $_itemColumn<int>('wedding_id')!;

    final manager = $$WeddingsTableTableManager(
      $_db,
      $_db.weddings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weddingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $EventVendorCategoriesTable,
    List<EventVendorCategory>
  >
  _eventVendorCategoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.eventVendorCategories,
        aliasName: $_aliasNameGenerator(
          db.vendorCategories.id,
          db.eventVendorCategories.vendorCategoryId,
        ),
      );

  $$EventVendorCategoriesTableProcessedTableManager
  get eventVendorCategoriesRefs {
    final manager = $$EventVendorCategoriesTableTableManager(
      $_db,
      $_db.eventVendorCategories,
    ).filter((f) => f.vendorCategoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventVendorCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VendorsTable, List<Vendor>> _vendorsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.vendors,
    aliasName: $_aliasNameGenerator(
      db.vendorCategories.id,
      db.vendors.vendorCategoryId,
    ),
  );

  $$VendorsTableProcessedTableManager get vendorsRefs {
    final manager = $$VendorsTableTableManager(
      $_db,
      $_db.vendors,
    ).filter((f) => f.vendorCategoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vendorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VendorCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $VendorCategoriesTable> {
  $$VendorCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeddingsTableFilterComposer get weddingId {
    final $$WeddingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableFilterComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> eventVendorCategoriesRefs(
    Expression<bool> Function($$EventVendorCategoriesTableFilterComposer f) f,
  ) {
    final $$EventVendorCategoriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.eventVendorCategories,
          getReferencedColumn: (t) => t.vendorCategoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventVendorCategoriesTableFilterComposer(
                $db: $db,
                $table: $db.eventVendorCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> vendorsRefs(
    Expression<bool> Function($$VendorsTableFilterComposer f) f,
  ) {
    final $$VendorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendors,
      getReferencedColumn: (t) => t.vendorCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorsTableFilterComposer(
            $db: $db,
            $table: $db.vendors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VendorCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $VendorCategoriesTable> {
  $$VendorCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeddingsTableOrderingComposer get weddingId {
    final $$WeddingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableOrderingComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendorCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendorCategoriesTable> {
  $$VendorCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeddingsTableAnnotationComposer get weddingId {
    final $$WeddingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableAnnotationComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> eventVendorCategoriesRefs<T extends Object>(
    Expression<T> Function($$EventVendorCategoriesTableAnnotationComposer a) f,
  ) {
    final $$EventVendorCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.eventVendorCategories,
          getReferencedColumn: (t) => t.vendorCategoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EventVendorCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.eventVendorCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> vendorsRefs<T extends Object>(
    Expression<T> Function($$VendorsTableAnnotationComposer a) f,
  ) {
    final $$VendorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vendors,
      getReferencedColumn: (t) => t.vendorCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorsTableAnnotationComposer(
            $db: $db,
            $table: $db.vendors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VendorCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VendorCategoriesTable,
          VendorCategory,
          $$VendorCategoriesTableFilterComposer,
          $$VendorCategoriesTableOrderingComposer,
          $$VendorCategoriesTableAnnotationComposer,
          $$VendorCategoriesTableCreateCompanionBuilder,
          $$VendorCategoriesTableUpdateCompanionBuilder,
          (VendorCategory, $$VendorCategoriesTableReferences),
          VendorCategory,
          PrefetchHooks Function({
            bool weddingId,
            bool eventVendorCategoriesRefs,
            bool vendorsRefs,
          })
        > {
  $$VendorCategoriesTableTableManager(
    _$AppDatabase db,
    $VendorCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendorCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendorCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendorCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weddingId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VendorCategoriesCompanion(
                id: id,
                weddingId: weddingId,
                name: name,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weddingId,
                required String name,
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VendorCategoriesCompanion.insert(
                id: id,
                weddingId: weddingId,
                name: name,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VendorCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                weddingId = false,
                eventVendorCategoriesRefs = false,
                vendorsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventVendorCategoriesRefs) db.eventVendorCategories,
                    if (vendorsRefs) db.vendors,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (weddingId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.weddingId,
                                    referencedTable:
                                        $$VendorCategoriesTableReferences
                                            ._weddingIdTable(db),
                                    referencedColumn:
                                        $$VendorCategoriesTableReferences
                                            ._weddingIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventVendorCategoriesRefs)
                        await $_getPrefetchedData<
                          VendorCategory,
                          $VendorCategoriesTable,
                          EventVendorCategory
                        >(
                          currentTable: table,
                          referencedTable: $$VendorCategoriesTableReferences
                              ._eventVendorCategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VendorCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).eventVendorCategoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vendorCategoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vendorsRefs)
                        await $_getPrefetchedData<
                          VendorCategory,
                          $VendorCategoriesTable,
                          Vendor
                        >(
                          currentTable: table,
                          referencedTable: $$VendorCategoriesTableReferences
                              ._vendorsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VendorCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).vendorsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vendorCategoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VendorCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VendorCategoriesTable,
      VendorCategory,
      $$VendorCategoriesTableFilterComposer,
      $$VendorCategoriesTableOrderingComposer,
      $$VendorCategoriesTableAnnotationComposer,
      $$VendorCategoriesTableCreateCompanionBuilder,
      $$VendorCategoriesTableUpdateCompanionBuilder,
      (VendorCategory, $$VendorCategoriesTableReferences),
      VendorCategory,
      PrefetchHooks Function({
        bool weddingId,
        bool eventVendorCategoriesRefs,
        bool vendorsRefs,
      })
    >;
typedef $$EventVendorCategoriesTableCreateCompanionBuilder =
    EventVendorCategoriesCompanion Function({
      required int eventId,
      required int vendorCategoryId,
      Value<int> rowid,
    });
typedef $$EventVendorCategoriesTableUpdateCompanionBuilder =
    EventVendorCategoriesCompanion Function({
      Value<int> eventId,
      Value<int> vendorCategoryId,
      Value<int> rowid,
    });

final class $$EventVendorCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EventVendorCategoriesTable,
          EventVendorCategory
        > {
  $$EventVendorCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.eventVendorCategories.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<int>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VendorCategoriesTable _vendorCategoryIdTable(_$AppDatabase db) =>
      db.vendorCategories.createAlias(
        $_aliasNameGenerator(
          db.eventVendorCategories.vendorCategoryId,
          db.vendorCategories.id,
        ),
      );

  $$VendorCategoriesTableProcessedTableManager get vendorCategoryId {
    final $_column = $_itemColumn<int>('vendor_category_id')!;

    final manager = $$VendorCategoriesTableTableManager(
      $_db,
      $_db.vendorCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vendorCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventVendorCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $EventVendorCategoriesTable> {
  $$EventVendorCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VendorCategoriesTableFilterComposer get vendorCategoryId {
    final $$VendorCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendorCategoryId,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventVendorCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $EventVendorCategoriesTable> {
  $$EventVendorCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VendorCategoriesTableOrderingComposer get vendorCategoryId {
    final $$VendorCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendorCategoryId,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventVendorCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventVendorCategoriesTable> {
  $$EventVendorCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VendorCategoriesTableAnnotationComposer get vendorCategoryId {
    final $$VendorCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendorCategoryId,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventVendorCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventVendorCategoriesTable,
          EventVendorCategory,
          $$EventVendorCategoriesTableFilterComposer,
          $$EventVendorCategoriesTableOrderingComposer,
          $$EventVendorCategoriesTableAnnotationComposer,
          $$EventVendorCategoriesTableCreateCompanionBuilder,
          $$EventVendorCategoriesTableUpdateCompanionBuilder,
          (EventVendorCategory, $$EventVendorCategoriesTableReferences),
          EventVendorCategory,
          PrefetchHooks Function({bool eventId, bool vendorCategoryId})
        > {
  $$EventVendorCategoriesTableTableManager(
    _$AppDatabase db,
    $EventVendorCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventVendorCategoriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$EventVendorCategoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EventVendorCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> eventId = const Value.absent(),
                Value<int> vendorCategoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventVendorCategoriesCompanion(
                eventId: eventId,
                vendorCategoryId: vendorCategoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int eventId,
                required int vendorCategoryId,
                Value<int> rowid = const Value.absent(),
              }) => EventVendorCategoriesCompanion.insert(
                eventId: eventId,
                vendorCategoryId: vendorCategoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventVendorCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false, vendorCategoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable:
                                    $$EventVendorCategoriesTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$EventVendorCategoriesTableReferences
                                        ._eventIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (vendorCategoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vendorCategoryId,
                                referencedTable:
                                    $$EventVendorCategoriesTableReferences
                                        ._vendorCategoryIdTable(db),
                                referencedColumn:
                                    $$EventVendorCategoriesTableReferences
                                        ._vendorCategoryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EventVendorCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventVendorCategoriesTable,
      EventVendorCategory,
      $$EventVendorCategoriesTableFilterComposer,
      $$EventVendorCategoriesTableOrderingComposer,
      $$EventVendorCategoriesTableAnnotationComposer,
      $$EventVendorCategoriesTableCreateCompanionBuilder,
      $$EventVendorCategoriesTableUpdateCompanionBuilder,
      (EventVendorCategory, $$EventVendorCategoriesTableReferences),
      EventVendorCategory,
      PrefetchHooks Function({bool eventId, bool vendorCategoryId})
    >;
typedef $$VendorsTableCreateCompanionBuilder =
    VendorsCompanion Function({
      Value<int> id,
      required int vendorCategoryId,
      required String name,
      Value<String?> contact,
      Value<int> price,
      Value<int> advancePaid,
      Value<String> bookingStatus,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$VendorsTableUpdateCompanionBuilder =
    VendorsCompanion Function({
      Value<int> id,
      Value<int> vendorCategoryId,
      Value<String> name,
      Value<String?> contact,
      Value<int> price,
      Value<int> advancePaid,
      Value<String> bookingStatus,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$VendorsTableReferences
    extends BaseReferences<_$AppDatabase, $VendorsTable, Vendor> {
  $$VendorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VendorCategoriesTable _vendorCategoryIdTable(_$AppDatabase db) =>
      db.vendorCategories.createAlias(
        $_aliasNameGenerator(
          db.vendors.vendorCategoryId,
          db.vendorCategories.id,
        ),
      );

  $$VendorCategoriesTableProcessedTableManager get vendorCategoryId {
    final $_column = $_itemColumn<int>('vendor_category_id')!;

    final manager = $$VendorCategoriesTableTableManager(
      $_db,
      $_db.vendorCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vendorCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VendorsTableFilterComposer
    extends Composer<_$AppDatabase, $VendorsTable> {
  $$VendorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get advancePaid => $composableBuilder(
    column: $table.advancePaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bookingStatus => $composableBuilder(
    column: $table.bookingStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VendorCategoriesTableFilterComposer get vendorCategoryId {
    final $$VendorCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendorCategoryId,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendorsTableOrderingComposer
    extends Composer<_$AppDatabase, $VendorsTable> {
  $$VendorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get advancePaid => $composableBuilder(
    column: $table.advancePaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bookingStatus => $composableBuilder(
    column: $table.bookingStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VendorCategoriesTableOrderingComposer get vendorCategoryId {
    final $$VendorCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendorCategoryId,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendorsTable> {
  $$VendorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get advancePaid => $composableBuilder(
    column: $table.advancePaid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bookingStatus => $composableBuilder(
    column: $table.bookingStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VendorCategoriesTableAnnotationComposer get vendorCategoryId {
    final $$VendorCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vendorCategoryId,
      referencedTable: $db.vendorCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VendorCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.vendorCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VendorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VendorsTable,
          Vendor,
          $$VendorsTableFilterComposer,
          $$VendorsTableOrderingComposer,
          $$VendorsTableAnnotationComposer,
          $$VendorsTableCreateCompanionBuilder,
          $$VendorsTableUpdateCompanionBuilder,
          (Vendor, $$VendorsTableReferences),
          Vendor,
          PrefetchHooks Function({bool vendorCategoryId})
        > {
  $$VendorsTableTableManager(_$AppDatabase db, $VendorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> vendorCategoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> contact = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<int> advancePaid = const Value.absent(),
                Value<String> bookingStatus = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VendorsCompanion(
                id: id,
                vendorCategoryId: vendorCategoryId,
                name: name,
                contact: contact,
                price: price,
                advancePaid: advancePaid,
                bookingStatus: bookingStatus,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int vendorCategoryId,
                required String name,
                Value<String?> contact = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<int> advancePaid = const Value.absent(),
                Value<String> bookingStatus = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => VendorsCompanion.insert(
                id: id,
                vendorCategoryId: vendorCategoryId,
                name: name,
                contact: contact,
                price: price,
                advancePaid: advancePaid,
                bookingStatus: bookingStatus,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VendorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vendorCategoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vendorCategoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vendorCategoryId,
                                referencedTable: $$VendorsTableReferences
                                    ._vendorCategoryIdTable(db),
                                referencedColumn: $$VendorsTableReferences
                                    ._vendorCategoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VendorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VendorsTable,
      Vendor,
      $$VendorsTableFilterComposer,
      $$VendorsTableOrderingComposer,
      $$VendorsTableAnnotationComposer,
      $$VendorsTableCreateCompanionBuilder,
      $$VendorsTableUpdateCompanionBuilder,
      (Vendor, $$VendorsTableReferences),
      Vendor,
      PrefetchHooks Function({bool vendorCategoryId})
    >;
typedef $$GuestsTableCreateCompanionBuilder =
    GuestsCompanion Function({
      Value<int> id,
      required int weddingId,
      required String name,
      Value<String?> groupName,
      Value<int> peopleCount,
      Value<String> rsvp,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$GuestsTableUpdateCompanionBuilder =
    GuestsCompanion Function({
      Value<int> id,
      Value<int> weddingId,
      Value<String> name,
      Value<String?> groupName,
      Value<int> peopleCount,
      Value<String> rsvp,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$GuestsTableReferences
    extends BaseReferences<_$AppDatabase, $GuestsTable, Guest> {
  $$GuestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WeddingsTable _weddingIdTable(_$AppDatabase db) => db.weddings
      .createAlias($_aliasNameGenerator(db.guests.weddingId, db.weddings.id));

  $$WeddingsTableProcessedTableManager get weddingId {
    final $_column = $_itemColumn<int>('wedding_id')!;

    final manager = $$WeddingsTableTableManager(
      $_db,
      $_db.weddings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weddingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GuestEventsTable, List<GuestEvent>>
  _guestEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.guestEvents,
    aliasName: $_aliasNameGenerator(db.guests.id, db.guestEvents.guestId),
  );

  $$GuestEventsTableProcessedTableManager get guestEventsRefs {
    final manager = $$GuestEventsTableTableManager(
      $_db,
      $_db.guestEvents,
    ).filter((f) => f.guestId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_guestEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GuestsTableFilterComposer
    extends Composer<_$AppDatabase, $GuestsTable> {
  $$GuestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get peopleCount => $composableBuilder(
    column: $table.peopleCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rsvp => $composableBuilder(
    column: $table.rsvp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeddingsTableFilterComposer get weddingId {
    final $$WeddingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableFilterComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> guestEventsRefs(
    Expression<bool> Function($$GuestEventsTableFilterComposer f) f,
  ) {
    final $$GuestEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestEvents,
      getReferencedColumn: (t) => t.guestId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestEventsTableFilterComposer(
            $db: $db,
            $table: $db.guestEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GuestsTableOrderingComposer
    extends Composer<_$AppDatabase, $GuestsTable> {
  $$GuestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get groupName => $composableBuilder(
    column: $table.groupName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get peopleCount => $composableBuilder(
    column: $table.peopleCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rsvp => $composableBuilder(
    column: $table.rsvp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeddingsTableOrderingComposer get weddingId {
    final $$WeddingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableOrderingComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuestsTable> {
  $$GuestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<int> get peopleCount => $composableBuilder(
    column: $table.peopleCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rsvp =>
      $composableBuilder(column: $table.rsvp, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeddingsTableAnnotationComposer get weddingId {
    final $$WeddingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableAnnotationComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> guestEventsRefs<T extends Object>(
    Expression<T> Function($$GuestEventsTableAnnotationComposer a) f,
  ) {
    final $$GuestEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guestEvents,
      getReferencedColumn: (t) => t.guestId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.guestEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GuestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GuestsTable,
          Guest,
          $$GuestsTableFilterComposer,
          $$GuestsTableOrderingComposer,
          $$GuestsTableAnnotationComposer,
          $$GuestsTableCreateCompanionBuilder,
          $$GuestsTableUpdateCompanionBuilder,
          (Guest, $$GuestsTableReferences),
          Guest,
          PrefetchHooks Function({bool weddingId, bool guestEventsRefs})
        > {
  $$GuestsTableTableManager(_$AppDatabase db, $GuestsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weddingId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> groupName = const Value.absent(),
                Value<int> peopleCount = const Value.absent(),
                Value<String> rsvp = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GuestsCompanion(
                id: id,
                weddingId: weddingId,
                name: name,
                groupName: groupName,
                peopleCount: peopleCount,
                rsvp: rsvp,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weddingId,
                required String name,
                Value<String?> groupName = const Value.absent(),
                Value<int> peopleCount = const Value.absent(),
                Value<String> rsvp = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GuestsCompanion.insert(
                id: id,
                weddingId: weddingId,
                name: name,
                groupName: groupName,
                peopleCount: peopleCount,
                rsvp: rsvp,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GuestsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({weddingId = false, guestEventsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (guestEventsRefs) db.guestEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (weddingId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.weddingId,
                                    referencedTable: $$GuestsTableReferences
                                        ._weddingIdTable(db),
                                    referencedColumn: $$GuestsTableReferences
                                        ._weddingIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (guestEventsRefs)
                        await $_getPrefetchedData<
                          Guest,
                          $GuestsTable,
                          GuestEvent
                        >(
                          currentTable: table,
                          referencedTable: $$GuestsTableReferences
                              ._guestEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GuestsTableReferences(
                                db,
                                table,
                                p0,
                              ).guestEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.guestId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GuestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GuestsTable,
      Guest,
      $$GuestsTableFilterComposer,
      $$GuestsTableOrderingComposer,
      $$GuestsTableAnnotationComposer,
      $$GuestsTableCreateCompanionBuilder,
      $$GuestsTableUpdateCompanionBuilder,
      (Guest, $$GuestsTableReferences),
      Guest,
      PrefetchHooks Function({bool weddingId, bool guestEventsRefs})
    >;
typedef $$GuestEventsTableCreateCompanionBuilder =
    GuestEventsCompanion Function({
      required int guestId,
      required int eventId,
      Value<int> rowid,
    });
typedef $$GuestEventsTableUpdateCompanionBuilder =
    GuestEventsCompanion Function({
      Value<int> guestId,
      Value<int> eventId,
      Value<int> rowid,
    });

final class $$GuestEventsTableReferences
    extends BaseReferences<_$AppDatabase, $GuestEventsTable, GuestEvent> {
  $$GuestEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GuestsTable _guestIdTable(_$AppDatabase db) => db.guests.createAlias(
    $_aliasNameGenerator(db.guestEvents.guestId, db.guests.id),
  );

  $$GuestsTableProcessedTableManager get guestId {
    final $_column = $_itemColumn<int>('guest_id')!;

    final manager = $$GuestsTableTableManager(
      $_db,
      $_db.guests,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guestIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.guestEvents.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<int>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GuestEventsTableFilterComposer
    extends Composer<_$AppDatabase, $GuestEventsTable> {
  $$GuestEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$GuestsTableFilterComposer get guestId {
    final $$GuestsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guestId,
      referencedTable: $db.guests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestsTableFilterComposer(
            $db: $db,
            $table: $db.guests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $GuestEventsTable> {
  $$GuestEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$GuestsTableOrderingComposer get guestId {
    final $$GuestsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guestId,
      referencedTable: $db.guests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestsTableOrderingComposer(
            $db: $db,
            $table: $db.guests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuestEventsTable> {
  $$GuestEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$GuestsTableAnnotationComposer get guestId {
    final $$GuestsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guestId,
      referencedTable: $db.guests,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuestsTableAnnotationComposer(
            $db: $db,
            $table: $db.guests,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuestEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GuestEventsTable,
          GuestEvent,
          $$GuestEventsTableFilterComposer,
          $$GuestEventsTableOrderingComposer,
          $$GuestEventsTableAnnotationComposer,
          $$GuestEventsTableCreateCompanionBuilder,
          $$GuestEventsTableUpdateCompanionBuilder,
          (GuestEvent, $$GuestEventsTableReferences),
          GuestEvent,
          PrefetchHooks Function({bool guestId, bool eventId})
        > {
  $$GuestEventsTableTableManager(_$AppDatabase db, $GuestEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuestEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuestEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuestEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> guestId = const Value.absent(),
                Value<int> eventId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GuestEventsCompanion(
                guestId: guestId,
                eventId: eventId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int guestId,
                required int eventId,
                Value<int> rowid = const Value.absent(),
              }) => GuestEventsCompanion.insert(
                guestId: guestId,
                eventId: eventId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GuestEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({guestId = false, eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (guestId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.guestId,
                                referencedTable: $$GuestEventsTableReferences
                                    ._guestIdTable(db),
                                referencedColumn: $$GuestEventsTableReferences
                                    ._guestIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable: $$GuestEventsTableReferences
                                    ._eventIdTable(db),
                                referencedColumn: $$GuestEventsTableReferences
                                    ._eventIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GuestEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GuestEventsTable,
      GuestEvent,
      $$GuestEventsTableFilterComposer,
      $$GuestEventsTableOrderingComposer,
      $$GuestEventsTableAnnotationComposer,
      $$GuestEventsTableCreateCompanionBuilder,
      $$GuestEventsTableUpdateCompanionBuilder,
      (GuestEvent, $$GuestEventsTableReferences),
      GuestEvent,
      PrefetchHooks Function({bool guestId, bool eventId})
    >;
typedef $$ShoppingItemsTableCreateCompanionBuilder =
    ShoppingItemsCompanion Function({
      Value<int> id,
      required int weddingId,
      required String name,
      Value<String> category,
      Value<bool> isPurchased,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$ShoppingItemsTableUpdateCompanionBuilder =
    ShoppingItemsCompanion Function({
      Value<int> id,
      Value<int> weddingId,
      Value<String> name,
      Value<String> category,
      Value<bool> isPurchased,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ShoppingItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ShoppingItemsTable, ShoppingItem> {
  $$ShoppingItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WeddingsTable _weddingIdTable(_$AppDatabase db) =>
      db.weddings.createAlias(
        $_aliasNameGenerator(db.shoppingItems.weddingId, db.weddings.id),
      );

  $$WeddingsTableProcessedTableManager get weddingId {
    final $_column = $_itemColumn<int>('wedding_id')!;

    final manager = $$WeddingsTableTableManager(
      $_db,
      $_db.weddings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weddingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShoppingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingItemsTable> {
  $$ShoppingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPurchased => $composableBuilder(
    column: $table.isPurchased,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeddingsTableFilterComposer get weddingId {
    final $$WeddingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableFilterComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingItemsTable> {
  $$ShoppingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPurchased => $composableBuilder(
    column: $table.isPurchased,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeddingsTableOrderingComposer get weddingId {
    final $$WeddingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableOrderingComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingItemsTable> {
  $$ShoppingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isPurchased => $composableBuilder(
    column: $table.isPurchased,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeddingsTableAnnotationComposer get weddingId {
    final $$WeddingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableAnnotationComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShoppingItemsTable,
          ShoppingItem,
          $$ShoppingItemsTableFilterComposer,
          $$ShoppingItemsTableOrderingComposer,
          $$ShoppingItemsTableAnnotationComposer,
          $$ShoppingItemsTableCreateCompanionBuilder,
          $$ShoppingItemsTableUpdateCompanionBuilder,
          (ShoppingItem, $$ShoppingItemsTableReferences),
          ShoppingItem,
          PrefetchHooks Function({bool weddingId})
        > {
  $$ShoppingItemsTableTableManager(_$AppDatabase db, $ShoppingItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShoppingItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShoppingItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShoppingItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weddingId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<bool> isPurchased = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ShoppingItemsCompanion(
                id: id,
                weddingId: weddingId,
                name: name,
                category: category,
                isPurchased: isPurchased,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weddingId,
                required String name,
                Value<String> category = const Value.absent(),
                Value<bool> isPurchased = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ShoppingItemsCompanion.insert(
                id: id,
                weddingId: weddingId,
                name: name,
                category: category,
                isPurchased: isPurchased,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShoppingItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({weddingId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (weddingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.weddingId,
                                referencedTable: $$ShoppingItemsTableReferences
                                    ._weddingIdTable(db),
                                referencedColumn: $$ShoppingItemsTableReferences
                                    ._weddingIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShoppingItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShoppingItemsTable,
      ShoppingItem,
      $$ShoppingItemsTableFilterComposer,
      $$ShoppingItemsTableOrderingComposer,
      $$ShoppingItemsTableAnnotationComposer,
      $$ShoppingItemsTableCreateCompanionBuilder,
      $$ShoppingItemsTableUpdateCompanionBuilder,
      (ShoppingItem, $$ShoppingItemsTableReferences),
      ShoppingItem,
      PrefetchHooks Function({bool weddingId})
    >;
typedef $$BudgetItemsTableCreateCompanionBuilder =
    BudgetItemsCompanion Function({
      Value<int> id,
      required int weddingId,
      required String categoryName,
      Value<int> estimated,
      Value<int> actual,
      Value<String?> notes,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$BudgetItemsTableUpdateCompanionBuilder =
    BudgetItemsCompanion Function({
      Value<int> id,
      Value<int> weddingId,
      Value<String> categoryName,
      Value<int> estimated,
      Value<int> actual,
      Value<String?> notes,
      Value<String> source,
      Value<String?> templateKey,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$BudgetItemsTableReferences
    extends BaseReferences<_$AppDatabase, $BudgetItemsTable, BudgetItem> {
  $$BudgetItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WeddingsTable _weddingIdTable(_$AppDatabase db) =>
      db.weddings.createAlias(
        $_aliasNameGenerator(db.budgetItems.weddingId, db.weddings.id),
      );

  $$WeddingsTableProcessedTableManager get weddingId {
    final $_column = $_itemColumn<int>('wedding_id')!;

    final manager = $$WeddingsTableTableManager(
      $_db,
      $_db.weddings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weddingIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BudgetItemsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimated => $composableBuilder(
    column: $table.estimated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actual => $composableBuilder(
    column: $table.actual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$WeddingsTableFilterComposer get weddingId {
    final $$WeddingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableFilterComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimated => $composableBuilder(
    column: $table.estimated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actual => $composableBuilder(
    column: $table.actual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$WeddingsTableOrderingComposer get weddingId {
    final $$WeddingsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableOrderingComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get estimated =>
      $composableBuilder(column: $table.estimated, builder: (column) => column);

  GeneratedColumn<int> get actual =>
      $composableBuilder(column: $table.actual, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get templateKey => $composableBuilder(
    column: $table.templateKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$WeddingsTableAnnotationComposer get weddingId {
    final $$WeddingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weddingId,
      referencedTable: $db.weddings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeddingsTableAnnotationComposer(
            $db: $db,
            $table: $db.weddings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BudgetItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetItemsTable,
          BudgetItem,
          $$BudgetItemsTableFilterComposer,
          $$BudgetItemsTableOrderingComposer,
          $$BudgetItemsTableAnnotationComposer,
          $$BudgetItemsTableCreateCompanionBuilder,
          $$BudgetItemsTableUpdateCompanionBuilder,
          (BudgetItem, $$BudgetItemsTableReferences),
          BudgetItem,
          PrefetchHooks Function({bool weddingId})
        > {
  $$BudgetItemsTableTableManager(_$AppDatabase db, $BudgetItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> weddingId = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
                Value<int> estimated = const Value.absent(),
                Value<int> actual = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BudgetItemsCompanion(
                id: id,
                weddingId: weddingId,
                categoryName: categoryName,
                estimated: estimated,
                actual: actual,
                notes: notes,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int weddingId,
                required String categoryName,
                Value<int> estimated = const Value.absent(),
                Value<int> actual = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> templateKey = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BudgetItemsCompanion.insert(
                id: id,
                weddingId: weddingId,
                categoryName: categoryName,
                estimated: estimated,
                actual: actual,
                notes: notes,
                source: source,
                templateKey: templateKey,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BudgetItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({weddingId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (weddingId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.weddingId,
                                referencedTable: $$BudgetItemsTableReferences
                                    ._weddingIdTable(db),
                                referencedColumn: $$BudgetItemsTableReferences
                                    ._weddingIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BudgetItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetItemsTable,
      BudgetItem,
      $$BudgetItemsTableFilterComposer,
      $$BudgetItemsTableOrderingComposer,
      $$BudgetItemsTableAnnotationComposer,
      $$BudgetItemsTableCreateCompanionBuilder,
      $$BudgetItemsTableUpdateCompanionBuilder,
      (BudgetItem, $$BudgetItemsTableReferences),
      BudgetItem,
      PrefetchHooks Function({bool weddingId})
    >;
typedef $$WaitlistInterestsTableCreateCompanionBuilder =
    WaitlistInterestsCompanion Function({
      Value<int> id,
      required String city,
      Value<DateTime> createdAt,
    });
typedef $$WaitlistInterestsTableUpdateCompanionBuilder =
    WaitlistInterestsCompanion Function({
      Value<int> id,
      Value<String> city,
      Value<DateTime> createdAt,
    });

class $$WaitlistInterestsTableFilterComposer
    extends Composer<_$AppDatabase, $WaitlistInterestsTable> {
  $$WaitlistInterestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WaitlistInterestsTableOrderingComposer
    extends Composer<_$AppDatabase, $WaitlistInterestsTable> {
  $$WaitlistInterestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WaitlistInterestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaitlistInterestsTable> {
  $$WaitlistInterestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WaitlistInterestsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WaitlistInterestsTable,
          WaitlistInterest,
          $$WaitlistInterestsTableFilterComposer,
          $$WaitlistInterestsTableOrderingComposer,
          $$WaitlistInterestsTableAnnotationComposer,
          $$WaitlistInterestsTableCreateCompanionBuilder,
          $$WaitlistInterestsTableUpdateCompanionBuilder,
          (
            WaitlistInterest,
            BaseReferences<
              _$AppDatabase,
              $WaitlistInterestsTable,
              WaitlistInterest
            >,
          ),
          WaitlistInterest,
          PrefetchHooks Function()
        > {
  $$WaitlistInterestsTableTableManager(
    _$AppDatabase db,
    $WaitlistInterestsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaitlistInterestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaitlistInterestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaitlistInterestsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => WaitlistInterestsCompanion(
                id: id,
                city: city,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String city,
                Value<DateTime> createdAt = const Value.absent(),
              }) => WaitlistInterestsCompanion.insert(
                id: id,
                city: city,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WaitlistInterestsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WaitlistInterestsTable,
      WaitlistInterest,
      $$WaitlistInterestsTableFilterComposer,
      $$WaitlistInterestsTableOrderingComposer,
      $$WaitlistInterestsTableAnnotationComposer,
      $$WaitlistInterestsTableCreateCompanionBuilder,
      $$WaitlistInterestsTableUpdateCompanionBuilder,
      (
        WaitlistInterest,
        BaseReferences<
          _$AppDatabase,
          $WaitlistInterestsTable,
          WaitlistInterest
        >,
      ),
      WaitlistInterest,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WeddingsTableTableManager get weddings =>
      $$WeddingsTableTableManager(_db, _db.weddings);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$ChecklistItemsTableTableManager get checklistItems =>
      $$ChecklistItemsTableTableManager(_db, _db.checklistItems);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$VendorCategoriesTableTableManager get vendorCategories =>
      $$VendorCategoriesTableTableManager(_db, _db.vendorCategories);
  $$EventVendorCategoriesTableTableManager get eventVendorCategories =>
      $$EventVendorCategoriesTableTableManager(_db, _db.eventVendorCategories);
  $$VendorsTableTableManager get vendors =>
      $$VendorsTableTableManager(_db, _db.vendors);
  $$GuestsTableTableManager get guests =>
      $$GuestsTableTableManager(_db, _db.guests);
  $$GuestEventsTableTableManager get guestEvents =>
      $$GuestEventsTableTableManager(_db, _db.guestEvents);
  $$ShoppingItemsTableTableManager get shoppingItems =>
      $$ShoppingItemsTableTableManager(_db, _db.shoppingItems);
  $$BudgetItemsTableTableManager get budgetItems =>
      $$BudgetItemsTableTableManager(_db, _db.budgetItems);
  $$WaitlistInterestsTableTableManager get waitlistInterests =>
      $$WaitlistInterestsTableTableManager(_db, _db.waitlistInterests);
}
