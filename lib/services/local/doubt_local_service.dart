import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';

final doubtLocalService = Provider(
  (ref) => DoubtLocalService(ref.watch(localDatabaseProvider)),
);

class DoubtLocalService {
  final AppDatabase _database;

  DoubtLocalService(this._database);

  /// get doubt questions
  Future<List<DoubtTableData>> getDoubtQuestions() async {
    final response =
        await (_database.select(_database.doubtTable)..orderBy([
              (t) => OrderingTerm(
                expression: t.createdAt,
                mode: OrderingMode.desc,
              ),
            ]))
            .get();

    return response;
  }

  /// this is to check if the question is in the doubt table or not
  Future<bool> isQuestionDoubt(String questionId) async {
    final response =
        await (_database.select(_database.doubtTable)..where((q) {
              return Expression.and([
                q.id.equals(questionId),
                q.isSolved.equals(true),
              ]);
            }))
            .getSingleOrNull();

    return response != null;
  }

  /// to get all the doubt question in stream
  Stream<List<DoubtTableData>> getDoubtQuestionsStream(int courseId) {
    return (_database.select(_database.doubtTable)..where((question) {
          return question.courseId.equals(courseId);
        }))
        .watch()
        .asBroadcastStream();
  }

  Future<bool> createDoubt(DoubtTableData question) async {
    final existingQuestion = await (_database.select(
      _database.doubtTable,
    )..where((q) => q.id.equals(question.id))).getSingleOrNull();

    // if the question doesn't contains in local table
    if (existingQuestion == null) {
      final response = await _database
          .into(_database.doubtTable)
          .insert(question);

      if (response > 0) {
        return true;
      } else {
        return false;
      }
    }

    return true;
  }

  Future<bool> updateDoubtStatus(DoubtTableData question) async {
    final response = await _database
        .update(_database.doubtTable)
        .replace(question);

    return response;
  }

  Future<bool> clearSolvedDoubts() async {
    final response = await (_database.delete(
      _database.doubtTable,
    )..where((e) => e.isSolved.equals(true))).goAndReturn();

    return response.isNotEmpty;
  }
}
