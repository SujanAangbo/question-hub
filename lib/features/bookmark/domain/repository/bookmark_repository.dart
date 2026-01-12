import 'package:question_hub/core/response/result.dart';

import '../../../../core/database/app_database.dart';
import '../../../../models/question_model.dart';

abstract class BookmarkRepository {
  Future<Result<List<QuestionModel>>> getBookmarkQuestions();

  Stream<List<QuestionTableData>> getQuestions(int courseId);

  Future<Result<bool>> isQuestionBookmarked(String questionId);
}
