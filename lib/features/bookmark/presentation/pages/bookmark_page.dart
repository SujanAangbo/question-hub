import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/bookmark/presentation/providers/bookmark_provider.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';

import '../widgets/question_card.dart';

@RoutePage()
class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionStreamProvider);
    return FocusScaffold(
      body: state.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(child: Text('No Bookmarked Questions'));
          }
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final question = QuestionModel.fromJson(data[index].toJson());
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
