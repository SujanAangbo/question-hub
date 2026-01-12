import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/models/doubt_question_model.dart';

import '../../../../core/database/app_database.dart';
import '../../../../models/question_model.dart';

abstract class DoubtRepository {
  Future<Result<List<DoubtQuestionModel>>> getDoubtQuestions();

  Stream<List<DoubtTableData>> getDoubtQuestionsStream(int courseId);

  Future<Result<bool>> isDoubtQuestion(String questionId);

  Future<Result<bool>> doubtQuestion(QuestionModel question, int courseId);

  Future<Result<bool>> updateDoubtStatus(DoubtQuestionModel question);

  Future<Result<bool>> clearSolvedDoubt();
}
