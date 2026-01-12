import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/common/snackbar.dart';
import 'package:question_hub/core/response/result_states.dart';
import 'package:question_hub/features/questions/data/repository/question_repository_impl.dart';
import 'package:question_hub/features/questions/domain/repository/question_repository.dart';

import '../../../../models/pyq_model.dart';
import '../../../../models/question_model.dart';

// final questionsProvider = AsyncNotifierProvider.family(QuestionsProvider.new);
final pyqQuestionProvider = AsyncNotifierProvider.family((int subjectId) {
  return PYQQuestionsProvider(subjectId);
});

class PYQQuestionsProvider extends AsyncNotifier<Map<String, List<PyqModel>>> {
  late QuestionRepository _questionRepository;

  PYQQuestionsProvider(this.subjectId);

  int subjectId;

  @override
  Future<Map<String, List<PyqModel>>> build() async {
    _questionRepository = ref.watch(questionRepositoryProvider);

    final questions = await getQuestions(subjectId);

    final response = formatQuestionBasedOnYear(questions);

    return response;
  }

  Future<List<PyqModel>> getQuestions(int subjectId) async {
    final data = await _questionRepository.getSubjectQuestions(subjectId);

    if (data is Success) {
      return data.data!;
    }

    return Future.error(data.error ?? 'Unable to fetch questions');
  }

  Map<String, List<PyqModel>> formatQuestionBasedOnYear(
    List<PyqModel> questions,
  ) {
    Map<String, List<PyqModel>> questionMappedWithYear = {};

    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];

      // first check batch and group with it. if there is no batch then group
      // with year.
      if (question.batch != null) {
        final key = 'Batch: ${question.batch} (${question.year})';
        if (questionMappedWithYear.containsKey(key)) {
          questionMappedWithYear[key]!.add(question);
        } else {
          questionMappedWithYear.putIfAbsent(key, () => [question]);
        }
        continue;
      }

      final key = 'Year: ${question.year}';
      if (questionMappedWithYear.containsKey(key)) {
        questionMappedWithYear[key]!.add(question);
      } else {
        questionMappedWithYear.putIfAbsent(key, () => [question]);
      }
    }

    return questionMappedWithYear;
  }

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
}
