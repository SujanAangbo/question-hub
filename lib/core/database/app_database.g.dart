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
  @override
  late final GeneratedColumnWithTypeConverter<List<QuestionBlockModel>, String>
  content =
      GeneratedColumn<String>(
        'content',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<QuestionBlockModel>>(
        $QuestionTableTable.$convertercontent,
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    marks,
    content,
    createdAt,
    updatedAt,
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      marks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marks'],
      )!,
      content: $QuestionTableTable.$convertercontent.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}content'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuestionTableTable createAlias(String alias) {
    return $QuestionTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<QuestionBlockModel>, String> $convertercontent =
      QuestionContentConverter();
}

class QuestionTableData extends DataClass
    implements Insertable<QuestionTableData> {
  final String id;
  final String marks;
  final List<QuestionBlockModel> content;
  final String createdAt;
  final String updatedAt;
  const QuestionTableData({
    required this.id,
    required this.marks,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['marks'] = Variable<String>(marks);
    {
      map['content'] = Variable<String>(
        $QuestionTableTable.$convertercontent.toSql(content),
      );
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  QuestionTableCompanion toCompanion(bool nullToAbsent) {
    return QuestionTableCompanion(
      id: Value(id),
      marks: Value(marks),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory QuestionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionTableData(
      id: serializer.fromJson<String>(json['id']),
      marks: serializer.fromJson<String>(json['marks']),
      content: serializer.fromJson<List<QuestionBlockModel>>(json['content']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'marks': serializer.toJson<String>(marks),
      'content': serializer.toJson<List<QuestionBlockModel>>(content),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  QuestionTableData copyWith({
    String? id,
    String? marks,
    List<QuestionBlockModel>? content,
    String? createdAt,
    String? updatedAt,
  }) => QuestionTableData(
    id: id ?? this.id,
    marks: marks ?? this.marks,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  QuestionTableData copyWithCompanion(QuestionTableCompanion data) {
    return QuestionTableData(
      id: data.id.present ? data.id.value : this.id,
      marks: data.marks.present ? data.marks.value : this.marks,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionTableData(')
          ..write('id: $id, ')
          ..write('marks: $marks, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, marks, content, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionTableData &&
          other.id == this.id &&
          other.marks == this.marks &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuestionTableCompanion extends UpdateCompanion<QuestionTableData> {
  final Value<String> id;
  final Value<String> marks;
  final Value<List<QuestionBlockModel>> content;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const QuestionTableCompanion({
    this.id = const Value.absent(),
    this.marks = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionTableCompanion.insert({
    required String id,
    this.marks = const Value.absent(),
    required List<QuestionBlockModel> content,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       content = Value(content),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<QuestionTableData> custom({
    Expression<String>? id,
    Expression<String>? marks,
    Expression<String>? content,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (marks != null) 'marks': marks,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionTableCompanion copyWith({
    Value<String>? id,
    Value<String>? marks,
    Value<List<QuestionBlockModel>>? content,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return QuestionTableCompanion(
      id: id ?? this.id,
      marks: marks ?? this.marks,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (marks.present) {
      map['marks'] = Variable<String>(marks.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(
        $QuestionTableTable.$convertercontent.toSql(content.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
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
          ..write('marks: $marks, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoubtTableTable extends DoubtTable
    with TableInfo<$DoubtTableTable, DoubtTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoubtTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  late final GeneratedColumnWithTypeConverter<List<QuestionBlockModel>, String>
  content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<QuestionBlockModel>>($DoubtTableTable.$convertercontent);
  static const VerificationMeta _isSolvedMeta = const VerificationMeta(
    'isSolved',
  );
  @override
  late final GeneratedColumn<bool> isSolved = GeneratedColumn<bool>(
    'is_solved',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_solved" IN (0, 1))',
    ),
    defaultValue: Constant(false),
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
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    marks,
    content,
    isSolved,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doubt_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoubtTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('marks')) {
      context.handle(
        _marksMeta,
        marks.isAcceptableOrUnknown(data['marks']!, _marksMeta),
      );
    }
    if (data.containsKey('is_solved')) {
      context.handle(
        _isSolvedMeta,
        isSolved.isAcceptableOrUnknown(data['is_solved']!, _isSolvedMeta),
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoubtTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoubtTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      marks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marks'],
      )!,
      content: $DoubtTableTable.$convertercontent.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}content'],
        )!,
      ),
      isSolved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_solved'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DoubtTableTable createAlias(String alias) {
    return $DoubtTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<QuestionBlockModel>, String> $convertercontent =
      QuestionContentConverter();
}

class DoubtTableData extends DataClass implements Insertable<DoubtTableData> {
  final String id;
  final String marks;
  final List<QuestionBlockModel> content;
  final bool? isSolved;
  final String createdAt;
  final String updatedAt;
  const DoubtTableData({
    required this.id,
    required this.marks,
    required this.content,
    this.isSolved,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['marks'] = Variable<String>(marks);
    {
      map['content'] = Variable<String>(
        $DoubtTableTable.$convertercontent.toSql(content),
      );
    }
    if (!nullToAbsent || isSolved != null) {
      map['is_solved'] = Variable<bool>(isSolved);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DoubtTableCompanion toCompanion(bool nullToAbsent) {
    return DoubtTableCompanion(
      id: Value(id),
      marks: Value(marks),
      content: Value(content),
      isSolved: isSolved == null && nullToAbsent
          ? const Value.absent()
          : Value(isSolved),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DoubtTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoubtTableData(
      id: serializer.fromJson<String>(json['id']),
      marks: serializer.fromJson<String>(json['marks']),
      content: serializer.fromJson<List<QuestionBlockModel>>(json['content']),
      isSolved: serializer.fromJson<bool?>(json['is_solved']),
      createdAt: serializer.fromJson<String>(json['created_at']),
      updatedAt: serializer.fromJson<String>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'marks': serializer.toJson<String>(marks),
      'content': serializer.toJson<List<QuestionBlockModel>>(content),
      'is_solved': serializer.toJson<bool?>(isSolved),
      'created_at': serializer.toJson<String>(createdAt),
      'updated_at': serializer.toJson<String>(updatedAt),
    };
  }

  DoubtTableData copyWith({
    String? id,
    String? marks,
    List<QuestionBlockModel>? content,
    Value<bool?> isSolved = const Value.absent(),
    String? createdAt,
    String? updatedAt,
  }) => DoubtTableData(
    id: id ?? this.id,
    marks: marks ?? this.marks,
    content: content ?? this.content,
    isSolved: isSolved.present ? isSolved.value : this.isSolved,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DoubtTableData copyWithCompanion(DoubtTableCompanion data) {
    return DoubtTableData(
      id: data.id.present ? data.id.value : this.id,
      marks: data.marks.present ? data.marks.value : this.marks,
      content: data.content.present ? data.content.value : this.content,
      isSolved: data.isSolved.present ? data.isSolved.value : this.isSolved,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoubtTableData(')
          ..write('id: $id, ')
          ..write('marks: $marks, ')
          ..write('content: $content, ')
          ..write('isSolved: $isSolved, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, marks, content, isSolved, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoubtTableData &&
          other.id == this.id &&
          other.marks == this.marks &&
          other.content == this.content &&
          other.isSolved == this.isSolved &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DoubtTableCompanion extends UpdateCompanion<DoubtTableData> {
  final Value<String> id;
  final Value<String> marks;
  final Value<List<QuestionBlockModel>> content;
  final Value<bool?> isSolved;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const DoubtTableCompanion({
    this.id = const Value.absent(),
    this.marks = const Value.absent(),
    this.content = const Value.absent(),
    this.isSolved = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoubtTableCompanion.insert({
    required String id,
    this.marks = const Value.absent(),
    required List<QuestionBlockModel> content,
    this.isSolved = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       content = Value(content),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DoubtTableData> custom({
    Expression<String>? id,
    Expression<String>? marks,
    Expression<String>? content,
    Expression<bool>? isSolved,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (marks != null) 'marks': marks,
      if (content != null) 'content': content,
      if (isSolved != null) 'is_solved': isSolved,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoubtTableCompanion copyWith({
    Value<String>? id,
    Value<String>? marks,
    Value<List<QuestionBlockModel>>? content,
    Value<bool?>? isSolved,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return DoubtTableCompanion(
      id: id ?? this.id,
      marks: marks ?? this.marks,
      content: content ?? this.content,
      isSolved: isSolved ?? this.isSolved,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (marks.present) {
      map['marks'] = Variable<String>(marks.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(
        $DoubtTableTable.$convertercontent.toSql(content.value),
      );
    }
    if (isSolved.present) {
      map['is_solved'] = Variable<bool>(isSolved.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoubtTableCompanion(')
          ..write('id: $id, ')
          ..write('marks: $marks, ')
          ..write('content: $content, ')
          ..write('isSolved: $isSolved, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseTableTable extends CourseTable
    with TableInfo<$CourseTableTable, CourseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CourseType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CourseType>($CourseTableTable.$convertertype);
  static const VerificationMeta _chMeta = const VerificationMeta('ch');
  @override
  late final GeneratedColumn<int> ch = GeneratedColumn<int>(
    'ch',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearsMeta = const VerificationMeta('years');
  @override
  late final GeneratedColumn<int> years = GeneratedColumn<int>(
    'years',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    type,
    ch,
    years,
    code,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseTableData> instance, {
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
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('ch')) {
      context.handle(_chMeta, ch.isAcceptableOrUnknown(data['ch']!, _chMeta));
    }
    if (data.containsKey('years')) {
      context.handle(
        _yearsMeta,
        years.isAcceptableOrUnknown(data['years']!, _yearsMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
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
  CourseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      type: $CourseTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      ch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ch'],
      ),
      years: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}years'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $CourseTableTable createAlias(String alias) {
    return $CourseTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CourseType, String, String> $convertertype =
      const EnumNameConverter<CourseType>(CourseType.values);
}

class CourseTableData extends DataClass implements Insertable<CourseTableData> {
  final int id;
  final String name;
  final String? description;
  final CourseType type;
  final int? ch;
  final int? years;
  final String? code;
  final String? createdAt;
  final String? updatedAt;
  const CourseTableData({
    required this.id,
    required this.name,
    this.description,
    required this.type,
    this.ch,
    this.years,
    this.code,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['type'] = Variable<String>(
        $CourseTableTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || ch != null) {
      map['ch'] = Variable<int>(ch);
    }
    if (!nullToAbsent || years != null) {
      map['years'] = Variable<int>(years);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  CourseTableCompanion toCompanion(bool nullToAbsent) {
    return CourseTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      type: Value(type),
      ch: ch == null && nullToAbsent ? const Value.absent() : Value(ch),
      years: years == null && nullToAbsent
          ? const Value.absent()
          : Value(years),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory CourseTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      type: $CourseTableTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      ch: serializer.fromJson<int?>(json['ch']),
      years: serializer.fromJson<int?>(json['years']),
      code: serializer.fromJson<String?>(json['code']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      updatedAt: serializer.fromJson<String?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<String>(
        $CourseTableTable.$convertertype.toJson(type),
      ),
      'ch': serializer.toJson<int?>(ch),
      'years': serializer.toJson<int?>(years),
      'code': serializer.toJson<String?>(code),
      'created_at': serializer.toJson<String?>(createdAt),
      'updated_at': serializer.toJson<String?>(updatedAt),
    };
  }

  CourseTableData copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    CourseType? type,
    Value<int?> ch = const Value.absent(),
    Value<int?> years = const Value.absent(),
    Value<String?> code = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => CourseTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    type: type ?? this.type,
    ch: ch.present ? ch.value : this.ch,
    years: years.present ? years.value : this.years,
    code: code.present ? code.value : this.code,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  CourseTableData copyWithCompanion(CourseTableCompanion data) {
    return CourseTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      type: data.type.present ? data.type.value : this.type,
      ch: data.ch.present ? data.ch.value : this.ch,
      years: data.years.present ? data.years.value : this.years,
      code: data.code.present ? data.code.value : this.code,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('ch: $ch, ')
          ..write('years: $years, ')
          ..write('code: $code, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    type,
    ch,
    years,
    code,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.ch == this.ch &&
          other.years == this.years &&
          other.code == this.code &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CourseTableCompanion extends UpdateCompanion<CourseTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<CourseType> type;
  final Value<int?> ch;
  final Value<int?> years;
  final Value<String?> code;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  const CourseTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.ch = const Value.absent(),
    this.years = const Value.absent(),
    this.code = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CourseTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required CourseType type,
    this.ch = const Value.absent(),
    this.years = const Value.absent(),
    this.code = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<CourseTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<int>? ch,
    Expression<int>? years,
    Expression<String>? code,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (ch != null) 'ch': ch,
      if (years != null) 'years': years,
      if (code != null) 'code': code,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CourseTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<CourseType>? type,
    Value<int?>? ch,
    Value<int?>? years,
    Value<String?>? code,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
  }) {
    return CourseTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      ch: ch ?? this.ch,
      years: years ?? this.years,
      code: code ?? this.code,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $CourseTableTable.$convertertype.toSql(type.value),
      );
    }
    if (ch.present) {
      map['ch'] = Variable<int>(ch.value);
    }
    if (years.present) {
      map['years'] = Variable<int>(years.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('ch: $ch, ')
          ..write('years: $years, ')
          ..write('code: $code, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuestionTableTable questionTable = $QuestionTableTable(this);
  late final $DoubtTableTable doubtTable = $DoubtTableTable(this);
  late final $CourseTableTable courseTable = $CourseTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    questionTable,
    doubtTable,
    courseTable,
  ];
}

typedef $$QuestionTableTableCreateCompanionBuilder =
    QuestionTableCompanion Function({
      required String id,
      Value<String> marks,
      required List<QuestionBlockModel> content,
      required String createdAt,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$QuestionTableTableUpdateCompanionBuilder =
    QuestionTableCompanion Function({
      Value<String> id,
      Value<String> marks,
      Value<List<QuestionBlockModel>> content,
      Value<String> createdAt,
      Value<String> updatedAt,
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

  ColumnFilters<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<QuestionBlockModel>,
    List<QuestionBlockModel>,
    String
  >
  get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
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

  ColumnOrderings<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
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

  GeneratedColumn<String> get marks =>
      $composableBuilder(column: $table.marks, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<QuestionBlockModel>, String>
  get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
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
                Value<String> marks = const Value.absent(),
                Value<List<QuestionBlockModel>> content = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuestionTableCompanion(
                id: id,
                marks: marks,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> marks = const Value.absent(),
                required List<QuestionBlockModel> content,
                required String createdAt,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => QuestionTableCompanion.insert(
                id: id,
                marks: marks,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
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
typedef $$DoubtTableTableCreateCompanionBuilder =
    DoubtTableCompanion Function({
      required String id,
      Value<String> marks,
      required List<QuestionBlockModel> content,
      Value<bool?> isSolved,
      required String createdAt,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$DoubtTableTableUpdateCompanionBuilder =
    DoubtTableCompanion Function({
      Value<String> id,
      Value<String> marks,
      Value<List<QuestionBlockModel>> content,
      Value<bool?> isSolved,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$DoubtTableTableFilterComposer
    extends Composer<_$AppDatabase, $DoubtTableTable> {
  $$DoubtTableTableFilterComposer({
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

  ColumnFilters<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<QuestionBlockModel>,
    List<QuestionBlockModel>,
    String
  >
  get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isSolved => $composableBuilder(
    column: $table.isSolved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DoubtTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DoubtTableTable> {
  $$DoubtTableTableOrderingComposer({
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

  ColumnOrderings<String> get marks => $composableBuilder(
    column: $table.marks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSolved => $composableBuilder(
    column: $table.isSolved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DoubtTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoubtTableTable> {
  $$DoubtTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get marks =>
      $composableBuilder(column: $table.marks, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<QuestionBlockModel>, String>
  get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<bool> get isSolved =>
      $composableBuilder(column: $table.isSolved, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DoubtTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoubtTableTable,
          DoubtTableData,
          $$DoubtTableTableFilterComposer,
          $$DoubtTableTableOrderingComposer,
          $$DoubtTableTableAnnotationComposer,
          $$DoubtTableTableCreateCompanionBuilder,
          $$DoubtTableTableUpdateCompanionBuilder,
          (
            DoubtTableData,
            BaseReferences<_$AppDatabase, $DoubtTableTable, DoubtTableData>,
          ),
          DoubtTableData,
          PrefetchHooks Function()
        > {
  $$DoubtTableTableTableManager(_$AppDatabase db, $DoubtTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoubtTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoubtTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoubtTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> marks = const Value.absent(),
                Value<List<QuestionBlockModel>> content = const Value.absent(),
                Value<bool?> isSolved = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoubtTableCompanion(
                id: id,
                marks: marks,
                content: content,
                isSolved: isSolved,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> marks = const Value.absent(),
                required List<QuestionBlockModel> content,
                Value<bool?> isSolved = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DoubtTableCompanion.insert(
                id: id,
                marks: marks,
                content: content,
                isSolved: isSolved,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DoubtTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoubtTableTable,
      DoubtTableData,
      $$DoubtTableTableFilterComposer,
      $$DoubtTableTableOrderingComposer,
      $$DoubtTableTableAnnotationComposer,
      $$DoubtTableTableCreateCompanionBuilder,
      $$DoubtTableTableUpdateCompanionBuilder,
      (
        DoubtTableData,
        BaseReferences<_$AppDatabase, $DoubtTableTable, DoubtTableData>,
      ),
      DoubtTableData,
      PrefetchHooks Function()
    >;
typedef $$CourseTableTableCreateCompanionBuilder =
    CourseTableCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      required CourseType type,
      Value<int?> ch,
      Value<int?> years,
      Value<String?> code,
      Value<String?> createdAt,
      Value<String?> updatedAt,
    });
typedef $$CourseTableTableUpdateCompanionBuilder =
    CourseTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<CourseType> type,
      Value<int?> ch,
      Value<int?> years,
      Value<String?> code,
      Value<String?> createdAt,
      Value<String?> updatedAt,
    });

class $$CourseTableTableFilterComposer
    extends Composer<_$AppDatabase, $CourseTableTable> {
  $$CourseTableTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CourseType, CourseType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get ch => $composableBuilder(
    column: $table.ch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get years => $composableBuilder(
    column: $table.years,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CourseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseTableTable> {
  $$CourseTableTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ch => $composableBuilder(
    column: $table.ch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get years => $composableBuilder(
    column: $table.years,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CourseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseTableTable> {
  $$CourseTableTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<CourseType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get ch =>
      $composableBuilder(column: $table.ch, builder: (column) => column);

  GeneratedColumn<int> get years =>
      $composableBuilder(column: $table.years, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CourseTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseTableTable,
          CourseTableData,
          $$CourseTableTableFilterComposer,
          $$CourseTableTableOrderingComposer,
          $$CourseTableTableAnnotationComposer,
          $$CourseTableTableCreateCompanionBuilder,
          $$CourseTableTableUpdateCompanionBuilder,
          (
            CourseTableData,
            BaseReferences<_$AppDatabase, $CourseTableTable, CourseTableData>,
          ),
          CourseTableData,
          PrefetchHooks Function()
        > {
  $$CourseTableTableTableManager(_$AppDatabase db, $CourseTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<CourseType> type = const Value.absent(),
                Value<int?> ch = const Value.absent(),
                Value<int?> years = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => CourseTableCompanion(
                id: id,
                name: name,
                description: description,
                type: type,
                ch: ch,
                years: years,
                code: code,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required CourseType type,
                Value<int?> ch = const Value.absent(),
                Value<int?> years = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
              }) => CourseTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                type: type,
                ch: ch,
                years: years,
                code: code,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CourseTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseTableTable,
      CourseTableData,
      $$CourseTableTableFilterComposer,
      $$CourseTableTableOrderingComposer,
      $$CourseTableTableAnnotationComposer,
      $$CourseTableTableCreateCompanionBuilder,
      $$CourseTableTableUpdateCompanionBuilder,
      (
        CourseTableData,
        BaseReferences<_$AppDatabase, $CourseTableTable, CourseTableData>,
      ),
      CourseTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuestionTableTableTableManager get questionTable =>
      $$QuestionTableTableTableManager(_db, _db.questionTable);
  $$DoubtTableTableTableManager get doubtTable =>
      $$DoubtTableTableTableManager(_db, _db.doubtTable);
  $$CourseTableTableTableManager get courseTable =>
      $$CourseTableTableTableManager(_db, _db.courseTable);
}
