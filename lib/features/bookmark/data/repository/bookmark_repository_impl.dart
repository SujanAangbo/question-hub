import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';
import 'package:question_hub/services/local/question_local_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final bookmarkRepositoryProvider = Provider(
  (ref) => BookmarkRepositoryImpl(ref.watch(questionLocalServiceProvider)),
);

class BookmarkRepositoryImpl implements BookmarkRepository {
  final QuestionLocalService _questionLocalService;

  BookmarkRepositoryImpl(this._questionLocalService);

  @override
  Future<Result<List<QuestionModel>>> getBookmarkQuestions() async {
    try {
      final response = await _questionLocalService.getQuestions();

      final questions = response
          .map((q) => QuestionModel.fromJson(q.toJson()))
          .toList();

      return Result.success(questions);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Stream<List<QuestionTableData>> getQuestions() {
    try {
      print('here inside getQuestion');
      return _questionLocalService.getQuestionsStream();
    } on PostgrestException catch (e) {
      print(e.toString());

      return Stream.error(e.toString());
      // return Result.error(e.message);
    } catch (e) {
      print(e.toString());
      return Stream.error(e.toString());
      // return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> isQuestionBookmarked(String questionId) async {
    try {
      final response = await _questionLocalService.isQuestionBookmarked(
        questionId,
      );

      return Result.success(response);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
