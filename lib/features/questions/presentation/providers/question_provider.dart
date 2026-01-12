import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/core/common/snackbar.dart';
import 'package:question_hub/features/questions/data/repository/question_repository_impl.dart';
import 'package:question_hub/features/questions/domain/repository/question_repository.dart';
import 'package:uuid/uuid.dart';

import '../../../../models/pyq_model.dart';
import '../../../../models/pyq_report_model.dart';
import '../../../../models/question_model.dart';

// final questionsProvider = AsyncNotifierProvider.family(QuestionsProvider.new);
final questionProvider = StateNotifierProvider((ref) {
  return QuestionsProvider(
    questionRepository: ref.watch(questionRepositoryProvider),
  );
});

class QuestionsProvider extends StateNotifier<void> {
  final QuestionRepository _questionRepository;

  QuestionsProvider({required final QuestionRepository questionRepository})
    : _questionRepository = questionRepository,
      super(null);

  Future<void> addToBookmark(
    BuildContext context,
    QuestionModel question,
    int courseId,
  ) async {
    final response = await _questionRepository.bookmarkQuestion(
      question,
      courseId,
    );

    if (response.isSuccess) {
      showSnackBar(
        context: context,
        message: "Question added to bookmark!",
        status: SnackBarStatus.success,
      );
    } else {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to bookmark question!",
        status: SnackBarStatus.error,
      );
    }
  }

  Future<void> removeBookmark(
    BuildContext context,
    QuestionModel question,
  ) async {
    final response = await _questionRepository.removeBookmark(question);

    if (response.isSuccess) {
      showSnackBar(
        context: context,
        message: "Question removed from bookmark!",
        status: SnackBarStatus.success,
      );
    } else {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to remove bookmark!",
        status: SnackBarStatus.error,
      );
    }
  }

  Future<void> reportQuestion({
    required QuestionModel question,
    required String message,
    required BuildContext context,
  }) async {
    throw UnimplementedError('to be implemented in the future');
  }

  Future<void> reportPyqQuestion({
    required PyqModel question,
    required String message,
    required BuildContext context,
  }) async {
    print("here inside report");
    final reportData = PyqReportModel(
      id: Uuid().v4(),
      course: question.course,
      subject: question.subject,
      message: message,
      year: question.year,
      batch: question.batch,
      sn: question.sn,
    );
    final response = await _questionRepository.reportQuestion(reportData);

    print("report response $response");
    if (response.isSuccess) {
      showSnackBar(
        context: context,
        message: "Reported question!",
        status: SnackBarStatus.success,
      );
    } else {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to report question!",
        status: SnackBarStatus.error,
      );
    }
  }

  Future<void> reportBatchYearQuestion({
    required int courseId,
    required int subjectId,
    required String message,
    required int? batch,
    required int year,
    required BuildContext context,
  }) async {
    final reportData = PyqReportModel(
      id: Uuid().v4(),
      course: courseId,
      subject: subjectId,
      message: message,
      year: year,
      batch: batch,
    );
    final response = await _questionRepository.reportQuestion(reportData);

    if (response.isSuccess) {
      showSnackBar(
        context: context,
        message: "Reported ${batch ?? year} question!",
        status: SnackBarStatus.success,
      );
    } else {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to report question!",
        status: SnackBarStatus.error,
      );
    }
  }
}
