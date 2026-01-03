import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/core/database/app_database.dart';
import 'package:question_hub/features/bookmark/domain/repository/doubt_repository.dart';
import 'package:question_hub/models/doubt_question_model.dart';

import '../../../../core/common/snackbar.dart';
import '../../../../models/question_model.dart';
import '../../data/repository/doubt_repository_impl.dart';

final doubtProvider = AsyncNotifierProvider(() => DoubtProvider());

final doubtQuestionStreamProvider = StreamProvider<List<DoubtTableData>>((ref) {
  return ref.watch(doubtProvider.notifier).getDoubtQuestions();
});

final isQuestionDoubtedProvider = StateProviderFamily((ref, String id) {
  final doubtQuestions = ref.watch(doubtQuestionStreamProvider).value ?? [];

  final filteredData = doubtQuestions
      .where((que) => id.compareTo(que.id) == 0)
      .toList();

  return filteredData.isNotEmpty;
});

class DoubtProvider extends AsyncNotifier<List<DoubtQuestionModel>> {
  late DoubtRepository _doubtRepository;

  @override
  Future<List<DoubtQuestionModel>> build() async {
    _doubtRepository = ref.watch(doubtRepositoryProvider);

    return [];
  }

  Stream<List<DoubtTableData>> getDoubtQuestions() {
    return _doubtRepository.getDoubtQuestionsStream();
  }

  Future<bool> isDoubtQuestion(String questionId) async {
    final response = await _doubtRepository.isDoubtQuestion(questionId);
    if (response.isSuccess) {
      return response.data ?? false;
    }

    return false;
  }

  Future<void> addDoubt(BuildContext context, QuestionModel question) async {
    final response = await _doubtRepository.doubtQuestion(question);

    if (response.isSuccess) {
      showSnackBar(
        context: context,
        message: "Question added to doubt!",
        status: SnackBarStatus.success,
      );
      context.router.pop();
    } else {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to doubt question!",
        status: SnackBarStatus.error,
      );
    }
  }

  Future<void> toggleStatus(
    BuildContext context,
    DoubtQuestionModel question,
  ) async {
    log(question.toString());
    final response = await _doubtRepository.updateDoubtStatus(question);

    if (!response.isSuccess) {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to remove bookmark!",
        status: SnackBarStatus.error,
      );
    }
  }

  Future<void> clearSolvedDoubt(BuildContext context) async {
    final response = await _doubtRepository.clearSolvedDoubt();

    if (response.isSuccess) {
      showSnackBar(
        context: context,
        message: "Cleared doubts!",
        status: SnackBarStatus.success,
      );
    } else {
      log(response.error ?? '');
      showSnackBar(
        context: context,
        message: "Unable to clear doubt!",
        status: SnackBarStatus.error,
      );
    }
  }
}
