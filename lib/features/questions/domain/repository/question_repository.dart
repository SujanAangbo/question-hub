import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/models/pyq_report_model.dart';

import '../../../../models/pyq_model.dart';
import '../../../../models/question_model.dart';

abstract class QuestionRepository {
  Future<Result<List<PyqModel>>> getSubjectQuestions(int subjectId);

  Future<Result<bool>> bookmarkQuestion(QuestionModel question, int courseId);

  Future<Result<bool>> removeBookmark(QuestionModel question);

  Future<Result<bool>> reportQuestion(PyqReportModel report);
}
