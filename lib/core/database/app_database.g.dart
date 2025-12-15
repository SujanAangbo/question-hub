// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $QuestionTableTable extends QuestionTable
    with TableInfo<$QuestionTableTable, QuestionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _questionMeta = const VerificationMeta(
    'question',
  );
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
    'question',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tableMeta = const VerificationMeta('table');
  @override
  late final GeneratedColumn<String> table = GeneratedColumn<String>(
    'table',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trailingMeta = const VerificationMeta(
    'trailing',
  );
  @override
  late final GeneratedColumn<String> trailing = GeneratedColumn<String>(
    'trailing',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _marksMeta = const VerificationMeta('marks');
  @override
  late final GeneratedColumn<String> marks = GeneratedColumn<String>(
    'marks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    question,
    table,
    image,
    trailing,
    marks,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question')) {
      context.handle(
        _questionMeta,
        question.isAcceptableOrUnknown(data['question']!, _questionMeta),
      );
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('table')) {
      context.handle(
        _tableMeta,
        table.isAcceptableOrUnknown(data['table']!, _tableMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('trailing')) {
      context.handle(
        _trailingMeta,
        trailing.isAcceptableOrUnknown(data['trailing']!, _trailingMeta),
      );
    }
    if (data.containsKey('marks')) {
      context.handle(
        _marksMeta,
        marks.isAcceptableOrUnknown(data['marks']!, _marksMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  QuestionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      question: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question'],
      )!,
      table: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table'],
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      trailing: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trailing'],
      ),
      marks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marks'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $QuestionTableTable createAlias(String alias) {
    return $QuestionTableTable(attachedDatabase, alias);
  }
}

class QuestionTableData extends DataClass
    implements Insertable<QuestionTableData> {
  final String id;
  final String question;
  final String? table;
  final String? image;
  final String? trailing;
  final String marks;
  final String createdAt;
  const QuestionTableData({
    required this.id,
    required this.question,
    this.table,
    this.image,
    this.trailing,
    required this.marks,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question'] = Variable<String>(question);
    if (!nullToAbsent || table != null) {
      map['table'] = Variable<String>(table);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || trailing != null) {
      map['trailing'] = Variable<String>(trailing);
    }
    map['marks'] = Variable<String>(marks);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  QuestionTableCompanion toCompanion(bool nullToAbsent) {
    return QuestionTableCompanion(
      id: Value(id),
      question: Value(question),
      table: table == null && nullToAbsent
          ? const Value.absent()
          : Value(table),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      trailing: trailing == null && nullToAbsent
          ? const Value.absent()
          : Value(trailing),
      marks: Value(marks),
      createdAt: Value(createdAt),
    );
  }

  factory QuestionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionTableData(
      id: serializer.fromJson<String>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      table: serializer.fromJson<String?>(json['table']),
      image: serializer.fromJson<String?>(json['image']),
      trailing: serializer.fromJson<String?>(json['trailing']),
      marks: serializer.fromJson<String>(json['marks']),
      createdAt: serializer.fromJson<String>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'question': serializer.toJson<String>(question),
      'table': serializer.toJson<String?>(table),
      'image': serializer.toJson<String?>(image),
      'trailing': serializer.toJson<String?>(trailing),
      'marks': serializer.toJson<String>(marks),
      'created_at': serializer.toJson<String>(createdAt),
    };
  }

  QuestionTableData copyWith({
    String? id,
    String? question,
    Value<String?> table = const Value.absent(),
    Value<String?> image = const Value.absent(),
    Value<String?> trailing = const Value.absent(),
    String? marks,
    String? createdAt,
  }) => QuestionTableData(
    id: id ?? this.id,
    question: question ?? this.question,
    table: table.present ? table.value : this.table,
    image: image.present ? image.value : this.image,
    trailing: trailing.present ? trailing.value : this.trailing,
    marks: marks ?? this.marks,
    createdAt: createdAt ?? this.createdAt,
  );
  QuestionTableData copyWithCompanion(QuestionTableCompanion data) {
    return QuestionTableData(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      table: data.table.present ? data.table.value : this.table,
      image: data.image.present ? data.image.value : this.image,
      trailing: data.trailing.present ? data.trailing.value : this.trailing,
      marks: data.marks.present ? data.marks.value : this.marks,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableData(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('table: $table, ')
          ..write('image: $image, ')
          ..write('trailing: $trailing, ')
          ..write('marks: $marks, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, question, table, image, trailing, marks, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionTableData &&
          other.id == this.id &&
          other.question == this.question &&
          other.table == this.table &&
          other.image == this.image &&
          other.trailing == this.trailing &&
          other.marks == this.marks &&
          other.createdAt == this.createdAt);
}

class QuestionTableCompanion extends UpdateCompanion<QuestionTableData> {
  final Value<String> id;
  final Value<String> question;
  final Value<String?> table;
  final Value<String?> image;
  final Value<String?> trailing;
  final Value<String> marks;
  final Value<String> createdAt;
  final Value<int> rowid;
  const QuestionTableCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.table = const Value.absent(),
    this.image = const Value.absent(),
    this.trailing = const Value.absent(),
    this.marks = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionTableCompanion.insert({
    required String id,
    required String question,
    this.table = const Value.absent(),
    this.image = const Value.absent(),
    this.trailing = const Value.absent(),
    this.marks = const Value.absent(),
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       question = Value(question),
       createdAt = Value(createdAt);
  static Insertable<QuestionTableData> custom({
    Expression<String>? id,
    Expression<String>? question,
    Expression<String>? table,
    Expression<String>? image,
    Expression<String>? trailing,
    Expression<String>? marks,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (table != null) 'table': table,
      if (image != null) 'image': image,
      if (trailing != null) 'trailing': trailing,
      if (marks != null) 'marks': marks,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionTableCompanion copyWith({
    Value<String>? id,
    Value<String>? question,
    Value<String?>? table,
    Value<String?>? image,
    Value<String?>? trailing,
    Value<String>? marks,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
    return QuestionTableCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      table: table ?? this.table,
      image: image ?? this.image,
      trailing: trailing ?? this.trailing,
      marks: marks ?? this.marks,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (table.present) {
      map['table'] = Variable<String>(table.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (trailing.present) {
      map['trailing'] = Variable<String>(trailing.value);
    }
    if (marks.present) {
      map['marks'] = Variable<String>(marks.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('table: $table, ')
          ..write('image: $image, ')
          ..write('trailing: $trailing, ')
          ..write('marks: $marks, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuestionTableTable questionTable = $QuestionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [questionTable];
}

typedef $$QuestionTableTableCreateCompanionBuilder =
    QuestionTableCompanion Function({
      required String id,
      required String question,
      Value<String?> table,
      Value<String?> image,
      Value<String?> trailing,
      Value<String> marks,
      required String createdAt,
      Value<int> rowid,
    });
typedef $$QuestionTableTableUpdateCompanionBuilder =
    QuestionTableCompanion Function({
      Value<String> id,
      Value<String> question,
      Value<String?> table,
      Value<String?> image,
      Value<String?> trailing,
      Value<String> marks,
      Value<String> createdAt,
      Value<int> rowid,
    });

class $$QuestionTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get table => $composableBuilder(
    column: $table.table,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trailing => $composableBuilder(
    column: $table.trailing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuestionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get table => $composableBuilder(
    column: $table.table,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trailing => $composableBuilder(
    column: $table.trailing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuestionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionTableTable> {
  $$QuestionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get table =>
      $composableBuilder(column: $table.table, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get trailing =>
      $composableBuilder(column: $table.trailing, builder: (column) => column);

  GeneratedColumn<String> get marks =>
      $composableBuilder(column: $table.marks, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$QuestionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionTableTable,
          QuestionTableData,
          $$QuestionTableTableFilterComposer,
          $$QuestionTableTableOrderingComposer,
          $$QuestionTableTableAnnotationComposer,
          $$QuestionTableTableCreateCompanionBuilder,
          $$QuestionTableTableUpdateCompanionBuilder,
          (
            QuestionTableData,
            BaseReferences<
              _$AppDatabase,
              $QuestionTableTable,
              QuestionTableData
            >,
          ),
          QuestionTableData,
          PrefetchHooks Function()
        > {
  $$QuestionTableTableTableManager(_$AppDatabase db, $QuestionTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<String?> table = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> trailing = const Value.absent(),
                Value<String> marks = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionTableCompanion(
                id: id,
                question: question,
                table: table,
                image: image,
                trailing: trailing,
                marks: marks,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String question,
                Value<String?> table = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> trailing = const Value.absent(),
                Value<String> marks = const Value.absent(),
                required String createdAt,
                Value<int> rowid = const Value.absent(),
              }) => QuestionTableCompanion.insert(
                id: id,
                question: question,
                table: table,
                image: image,
                trailing: trailing,
                marks: marks,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuestionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionTableTable,
      QuestionTableData,
      $$QuestionTableTableFilterComposer,
      $$QuestionTableTableOrderingComposer,
      $$QuestionTableTableAnnotationComposer,
      $$QuestionTableTableCreateCompanionBuilder,
      $$QuestionTableTableUpdateCompanionBuilder,
      (
        QuestionTableData,
        BaseReferences<_$AppDatabase, $QuestionTableTable, QuestionTableData>,
      ),
      QuestionTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuestionTableTableTableManager get questionTable =>
      $$QuestionTableTableTableManager(_db, _db.questionTable);
}
