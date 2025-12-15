import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/common/snackbar.dart';
import 'package:question_hub/core/response/result_states.dart';
import 'package:question_hub/features/home/data/models/pyq_model.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';
import 'package:question_hub/features/questions/data/repository/question_repository_impl.dart';
import 'package:question_hub/features/questions/domain/repository/question_repository.dart';

// final questionsProvider = AsyncNotifierProvider.family(QuestionsProvider.new);
final pyqQuestionProvider = AsyncNotifierProvider.family((int subjectId) {
  return PYQQuestionsProvider(subjectId);
});

class PYQQuestionsProvider extends AsyncNotifier<Map<int, List<PyqModel>>> {
  late QuestionRepository _questionRepository;

  PYQQuestionsProvider(this.subjectId) {
    print("inside constructor");
  }

  int subjectId;

  @override
  Future<Map<int, List<PyqModel>>> build() async {
    print("over here");

    _questionRepository = ref.watch(questionRepositoryProvider);

    final questions = await getQuestions(subjectId);

    final response = formatQuestionBasedOnYear(questions);

    return response;
  }

  Future<List<PyqModel>> getQuestions(int subjectId) async {
    final data = await _questionRepository.getSubjectQuestions(subjectId);

    print("result: $data");

    if (data is Success) {
      return data.data!;
    }

    return Future.error(data.error ?? 'Unable to fetch questions');
  }

  Map<int, List<PyqModel>> formatQuestionBasedOnYear(List<PyqModel> questions) {
    Map<int, List<PyqModel>> questionMappedWithYear = {};

    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];

      if (questionMappedWithYear.containsKey(question.year)) {
        questionMappedWithYear[question.year]!.add(question);
      } else {
        questionMappedWithYear.putIfAbsent(question.year, () => [question]);
      }
    }

    return questionMappedWithYear;
  }

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
