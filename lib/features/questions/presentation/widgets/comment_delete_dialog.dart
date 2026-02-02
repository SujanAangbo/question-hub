import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/app/routes/app_router.dart';
import 'package:question_hub/theme/color_palette.dart';

import '../providers/question_detail_provider.dart';

class CommentDeleteDialog extends ConsumerWidget {
  const CommentDeleteDialog({
    super.key,
    required this.commentId,
    required this.questionId,
  });

  final int commentId;
  final String questionId;

  static Future<void> show(
    BuildContext context,
    int commentId,
    String questionId,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return CommentDeleteDialog(
          commentId: commentId,
          questionId: questionId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionDetailProvider(questionId));
    final provider = ref.watch(questionDetailProvider(questionId).notifier);

    return AlertDialog(
      title: Text("Delete comment"),
      content: Text("Are you sure you want to delete this comment?"),
      actions: [
        TextButton(
          onPressed: () {
            AppRouterHelper.pop();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            await provider.deleteComment(commentId: commentId);
            AppRouterHelper.pop();
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              ColorPalette.error.withValues(alpha: 0.2),
            ),
          ),
          child: state.value?.isDeleteLoading ?? false
              ? CupertinoActivityIndicator()
              : Text(
                  "Delete",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: ColorPalette.error),
                ),
        ),
      ],
    );
  }
}
