import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';

import '../../../../core/database/app_database.dart';

abstract class BookmarkRepository {
  Future<Result<List<QuestionModel>>> getBookmarkQuestions();

  Stream<List<QuestionTableData>> getQuestions();

  Future<Result<bool>> isQuestionBookmarked(String questionId);
}
