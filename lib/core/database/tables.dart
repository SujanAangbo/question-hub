import 'package:drift/drift.dart';

class QuestionTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get question => text()();
  TextColumn get table => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get trailing => text().nullable()();
  TextColumn get marks => text().withDefault(Constant(''))();

  @JsonKey('created_at')
  TextColumn get createdAt => text().named('created_at')();
}
