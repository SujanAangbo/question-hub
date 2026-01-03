import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/services/local/question_local_service.dart';
import 'package:question_hub/services/remote/question_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../models/pyq_model.dart';
import '../../../../models/question_model.dart';
import '../../domain/repository/question_repository.dart';

final questionRepositoryProvider = Provider(
  (ref) => QuestionRepositoryImpl(
    questionService: ref.watch(questionServiceProvider),
    localService: ref.watch(questionLocalServiceProvider),
  ),
);

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionService _questionService;
  final QuestionLocalService _localService;

  QuestionRepositoryImpl({
    required final QuestionService questionService,
    required final QuestionLocalService localService,
  }) : _questionService = questionService,
       _localService = localService;

  @override
  Future<Result<List<PyqModel>>> getSubjectQuestions(int subjectId) async {
    try {
      final questions = await _questionService.getSubjectQuestions(subjectId);
      return Result.success(questions);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e, st) {
      return Result.error(e.toString() + st.toString());
    }
  }

  @override
  Future<Result<bool>> bookmarkQuestion(QuestionModel question) async {
    try {
      log("original: ${question.toJson()}");
      final data = QuestionTableData.fromJson(
        question.toJson(),
      ).copyWith(createdAt: DateTime.now().toIso8601String());
      log("The data is : $data");
      await _localService.insertQuestion(data);
      return Result.success(true);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e, st) {
      return Result.error(e.toString() + st.toString());
    }
  }

  @override
  Future<Result<bool>> removeBookmark(QuestionModel question) async {
    try {
      log("original: ${question.toJson()}");
      final data = QuestionTableData.fromJson(
        question.toJson(),
      ).copyWith(createdAt: DateTime.now().toIso8601String());
      log("The data is : $data");
      final response = await _localService.removeQuestion(data);
      return Result.success(response);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e, st) {
      return Result.error(e.toString() + st.toString());
    }
  }
}
