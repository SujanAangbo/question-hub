import 'package:drift/drift.dart';

import '../../enums/course_type.dart';

class CourseTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get type => textEnum<CourseType>()();
  IntColumn get ch => integer().nullable()();
  IntColumn get years => integer().nullable()();
  TextColumn get code => text().nullable()();
  @JsonKey('created_at')
  TextColumn get createdAt => text().named('created_at').nullable()();
  @JsonKey('updated_at')
  TextColumn get updatedAt => text().named('updated_at').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
