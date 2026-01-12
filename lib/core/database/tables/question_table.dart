import 'package:drift/drift.dart';

import 'converter.dart';
import 'tables.dart';

class QuestionTable extends Table {
  TextColumn get id => text()();
  TextColumn get marks => text().withDefault(Constant(''))();
  TextColumn get content => text().map(QuestionContentConverter())();

  @JsonKey('course_id')
  IntColumn get courseId =>
      integer().named('course_id').references(CourseTable, #id)();

  @JsonKey('created_at')
  TextColumn get createdAt => text().named('created_at')();
  @JsonKey('updated_at')
  TextColumn get updatedAt => text().named('updated_at')();

  @override
  Set<Column> get primaryKey => {id};
}
