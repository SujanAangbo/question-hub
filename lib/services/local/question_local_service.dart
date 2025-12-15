import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';

final questionLocalServiceProvider = Provider(
  (ref) => QuestionLocalService(ref.watch(localDatabaseProvider)),
);

class QuestionLocalService {
  final AppDatabase _database;

  QuestionLocalService(this._database);

  Future<List<QuestionTableData>> getQuestions() async {
    final response =
        await (_database.select(_database.questionTable)..orderBy([
              (t) => OrderingTerm(
                expression: t.createdAt,
                mode: OrderingMode.desc,
              ),
            ]))
            .get();

    return response;
  }

  Future<bool> isQuestionBookmarked(String questionId) async {
    final response =
        await (_database.select(_database.questionTable)..where((q) {
              return Constant(questionId.compareTo(q.id.name) == 0);
            }))
            .getSingleOrNull();

    return response != null;
  }

  Stream<List<QuestionTableData>> getQuestionsStream() {
    return _database
        .select(_database.questionTable)
        .watch()
        .asBroadcastStream();
  }

  Future<bool> insertQuestion(QuestionTableData question) async {
    final existingQuestion = await (_database.select(
      _database.questionTable,
    )..where((q) => q.id.equals(question.id))).getSingleOrNull();

    // if the question doesn't contains in local table
    if (existingQuestion == null) {
      final response = await _database
          .into(_database.questionTable)
          .insert(question);

      if (response > 0) {
        return true;
      } else {
        return false;
      }
    }

    return true;
  }

  Future<bool> removeQuestion(QuestionTableData question) async {
    final response = await (_database.delete(
      _database.questionTable,
    )..where((e) => e.id.equals(question.id))).goAndReturn();

    return response.isNotEmpty;
  }
}
