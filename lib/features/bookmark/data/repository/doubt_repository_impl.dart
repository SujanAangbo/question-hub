import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/bookmark/domain/repository/doubt_repository.dart';
import 'package:question_hub/services/local/doubt_local_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../models/doubt_question_model.dart';
import '../../../../models/question_model.dart';

final doubtRepositoryProvider = Provider(
  (ref) => BookmarkRepositoryImpl(ref.watch(doubtLocalService)),
);

class BookmarkRepositoryImpl implements DoubtRepository {
  final DoubtLocalService _localService;

  BookmarkRepositoryImpl(this._localService);

  @override
  Stream<List<DoubtTableData>> getDoubtQuestionsStream(int courseId) {
    try {
      return _localService.getDoubtQuestionsStream(courseId);
    } on PostgrestException catch (e) {
      print(e.toString());

      return Stream.error(e.toString());
    } catch (e) {
      print(e.toString());
      return Stream.error(e.toString());
    }
  }

  @override
  Future<Result<List<DoubtQuestionModel>>> getDoubtQuestions() async {
    try {
      final response = await _localService.getDoubtQuestions();

      final questions = response
          .map((q) => DoubtQuestionModel.fromJson(q.toJson()))
          .toList();

      return Result.success(questions);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> isDoubtQuestion(String questionId) async {
    try {
      final response = await _localService.isQuestionDoubt(questionId);

      return Result.success(response);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> doubtQuestion(
    QuestionModel question,
    int courseId,
  ) async {
    try {
      final data = DoubtTableData.fromJson(
        question.toJson()..addAll({
          'course_id': courseId,
          'created_at': DateTime.now().toIso8601String(),
        }),
      );
      await _localService.createDoubt(data);
      return Result.success(true);
    } on PostgrestException catch (e) {
      print(e.toString());
      return Result.error(e.message);
    } catch (e) {
      print(e.toString());

      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> updateDoubtStatus(DoubtQuestionModel question) async {
    try {
      final data = DoubtTableData.fromJson(
        question.toJson(),
      ).copyWith(createdAt: DateTime.now().toIso8601String());
      await _localService.updateDoubtStatus(data);
      return Result.success(true);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> clearSolvedDoubt() async {
    try {
      await _localService.clearSolvedDoubts();
      return Result.success(true);
    } on PostgrestException catch (e) {
      print(e.toString());
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
