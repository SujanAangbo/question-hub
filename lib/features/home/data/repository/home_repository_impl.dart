import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/services/remote/question_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../models/subject_model.dart';
import '../../domain/repository/home_repository.dart';

final homeRepositoryProvider = Provider(
  (ref) =>
      HomeRepositoryImpl(questionService: ref.watch(questionServiceProvider)),
);

class HomeRepositoryImpl implements HomeRepository {
  final QuestionService _questionService;

  HomeRepositoryImpl({required final QuestionService questionService})
    : _questionService = questionService;

  @override
  Future<Result<List<SubjectModel>>> getCourseSubjects(int id) async {
    try {
      final questions = await _questionService.getCourseSubjects(id);
      return Result.success(questions);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
