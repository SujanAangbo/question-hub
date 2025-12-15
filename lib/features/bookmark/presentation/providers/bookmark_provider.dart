import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/core/database/app_database.dart';
import 'package:question_hub/features/bookmark/data/repository/bookmark_repository_impl.dart';
import 'package:question_hub/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';

final bookmarkProvider = AsyncNotifierProvider(() => BookmarkProvider());

final questionStreamProvider = StreamProvider<List<QuestionTableData>>((ref) {
  return ref.watch(bookmarkProvider.notifier).getBookmarkQuestions();
});

final isQuestionBookmarkedProvider = StateProviderFamily((ref, String id) {
  final bookmarkedQuestions = ref.watch(questionStreamProvider).value ?? [];

  final filteredData = bookmarkedQuestions
      .where((que) => id.compareTo(que.id) == 0)
      .toList();

  return filteredData.isNotEmpty;
});

class BookmarkProvider extends AsyncNotifier<List<QuestionModel>> {
  late BookmarkRepository _bookmarkRepository;

  @override
  Future<List<QuestionModel>> build() async {
    _bookmarkRepository = ref.watch(bookmarkRepositoryProvider);

    return [];
  }

  Stream<List<QuestionTableData>> getBookmarkQuestions() {
    return _bookmarkRepository.getQuestions();
  }

  Future<bool> isQuestionBookmarked(String questionId) async {
    final response = await _bookmarkRepository.isQuestionBookmarked(questionId);
    if (response.isSuccess) {
      return response.data ?? false;
    }

    return false;
  }
}
