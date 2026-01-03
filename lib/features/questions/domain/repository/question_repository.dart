import 'package:question_hub/core/response/result.dart';

import '../../../../models/pyq_model.dart';
import '../../../../models/question_model.dart';

abstract class QuestionRepository {
  Future<Result<List<PyqModel>>> getSubjectQuestions(int subjectId);

  Future<Result<bool>> bookmarkQuestion(QuestionModel question);

  Future<Result<bool>> removeBookmark(QuestionModel question);
}
