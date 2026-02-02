import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/questions/presentation/widgets/comment_report_dialog.dart';
import 'package:question_hub/models/comment_model.dart';
import 'package:question_hub/utils/ui/cached_network_image.dart';
import 'package:question_hub/utils/ui/profile_image_renderer.dart';
import 'package:question_hub/utils/ui/sized_box.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'comment_delete_dialog.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final CommentModel comment;

  Future<void> deleteComment(BuildContext context) async {
    await CommentDeleteDialog.show(context, comment.id, comment.questionId);
  }

  Future<void> reportComment(BuildContext context) async {
    await CommentReportDialog.show(context, comment.id, comment.questionId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImageRenderer(radius: 26, networkImage: comment.user.image),
            8.widthBox,

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.user.name, style: textTheme.titleMedium),
                2.heightBox,
                Text(
                  " • ${timeago.format(DateTime.parse(comment.createdAt!))}",
                  style: textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
            8.widthBox,

            Spacer(),

            Consumer(
              builder: (context, ref, child) {
                final userState = ref.watch(userProvider);
                return PopupMenuButton(
                  padding: EdgeInsetsGeometry.zero,
                  menuPadding: EdgeInsetsGeometry.zero,
                  position: PopupMenuPosition.under,
                  onSelected: (value) {
                    if (value == 1) {
                      deleteComment(context);
                    } else if (value == 2) {
                      reportComment(context);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      // if (userState?.id == null ||
                      //     userState?.id != comment.userId) ...[
                      PopupMenuItem(value: 2, child: Text("Report")),
                      // ] else
                      PopupMenuItem(
                        value: 1,
                        child: Text("Delete"),
                        onTap: () {},
                      ),
                    ];
                  },
                );
              },
            ),
          ],
        ),
        8.heightBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.content, style: textTheme.bodyLarge),
            4.heightBox,
            if (comment.image != null)
              if (comment.image!.startsWith('/'))
                Image.file(File(comment.image!))
              else
                BuildCachedNetworkImage(
                  imageRadius: 10,
                  imageUrl: comment.image!,
                ),
          ],
        ),
      ],
    );
  }
}
