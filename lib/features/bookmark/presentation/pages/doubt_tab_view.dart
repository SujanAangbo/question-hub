import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/bookmark/presentation/widgets/doubt_question_card.dart';
import 'package:question_hub/models/doubt_question_model.dart';

import '../providers/doubt_provider.dart';

class DoubtTabView extends ConsumerWidget {
  const DoubtTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(doubtQuestionStreamProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: state.when(
        data: (data) {
          log(data.toString());
          if (data.isEmpty) {
            return Center(child: Text('No Doubt Questions!'));
          }
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final questionData = data[index];
              final question = DoubtQuestionModel(
                id: questionData.id,
                content: questionData.content,
                marks: questionData.marks,
                createdAt: questionData.createdAt,
                updatedAt: questionData.updatedAt,
                isSolved: questionData.isSolved ?? false,
              );
              return DoubtQuestionCard(question: question, sn: index + 1);
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
