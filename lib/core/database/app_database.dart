import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/tables.dart';

part 'app_database.g.dart';

final localDatabaseProvider = Provider((ref) => AppDatabase());

@DriftDatabase(tables: [QuestionTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? q]) : super(q ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      return m.createAll();
    },
    onUpgrade: (m, from, to) async {
      return;
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'question_hub');
  }
}
