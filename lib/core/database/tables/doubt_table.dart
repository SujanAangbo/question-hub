import 'package:drift/drift.dart';

import 'converter.dart';

class DoubtTable extends Table {
  TextColumn get id => text()();
  TextColumn get marks => text().withDefault(Constant(''))();
  TextColumn get content => text().map(QuestionContentConverter())();
  @JsonKey('is_solved')
  BoolColumn get isSolved =>
      boolean().withDefault(Constant(false)).nullable()();

  @JsonKey('created_at')
  TextColumn get createdAt => text().named('created_at')();
  @JsonKey('updated_at')
  TextColumn get updatedAt => text().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};
}
