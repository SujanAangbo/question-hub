import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/core/common/snackbar.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';
import 'package:question_hub/features/questions/data/repository/question_repository_impl.dart';
import 'package:question_hub/features/questions/domain/repository/question_repository.dart';

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
  ) async {
    final response = await _questionRepository.bookmarkQuestion(question);

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
}
