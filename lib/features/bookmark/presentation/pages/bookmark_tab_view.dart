import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/question_model.dart';
import '../providers/bookmark_provider.dart';
import '../widgets/question_card.dart';

class BookmarkTabView extends ConsumerWidget {
  const BookmarkTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionStreamProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: state.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(child: Text('No Bookmarked Questions'));
          }
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final questionData = data[index];
              final question = QuestionModel(
                id: questionData.id,
                content: questionData.content,
                marks: questionData.marks,
                createdAt: questionData.createdAt,
                updatedAt: questionData.updatedAt,
              );
              return QuestionCard(question: question, sn: index + 1);
            },
          );
        },
        error: (err, st) {
          return Center(child: Text(err.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
