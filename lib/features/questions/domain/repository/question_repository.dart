import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/home/data/models/pyq_model.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';

abstract class QuestionRepository {
  Future<Result<List<PyqModel>>> getSubjectQuestions(int subjectId);

  Future<Result<bool>> bookmarkQuestion(QuestionModel question);

  Future<Result<bool>> removeBookmark(QuestionModel question);
}
