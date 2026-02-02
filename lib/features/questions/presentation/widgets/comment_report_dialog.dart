import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/app/routes/app_router.dart';
import 'package:question_hub/core/common/validator.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/questions/presentation/providers/question_detail_provider.dart';
import 'package:question_hub/theme/color_palette.dart';
import 'package:question_hub/utils/ui/sized_box.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

import '../../../../app/routes/app_route.gr.dart';

class CommentReportDialog extends ConsumerStatefulWidget {
  const CommentReportDialog({
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
        return CommentReportDialog(
          commentId: commentId,
          questionId: questionId,
        );
      },
    );
  }

  @override
  ConsumerState<CommentReportDialog> createState() =>
      _CommentReportDialogState();
}

class _CommentReportDialogState extends ConsumerState<CommentReportDialog> {
  String? reason;
  final messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> reportComment() async {
    // perform login validation
    final currentUser = ref.read(userProvider);

    if (currentUser == null) {
      final response = await AppRouterHelper.push(
        EmailLoginRoute(isPopAble: true),
      );

      if (response is bool? && (response == null || response == false)) {
        ToastService.e("Authentication failed");
        return;
      }
    }

    // get user data after authentication
    final authenticatedUser = ref.read(userProvider);

    if ((_formKey.currentState?.validate() ?? false) &&
        authenticatedUser != null) {
      await ref
          .read(questionDetailProvider(widget.questionId).notifier)
          .reportComment(
            commentId: widget.commentId,
            reason: reason!,
            content: messageController.text.trim(),
            userId: authenticatedUser.id,
          );
      AppRouterHelper.pop();
    }
  }

  void selectReason(String? value) {
    setState(() {
      reason = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(questionDetailProvider(widget.questionId));

    return AlertDialog(
      title: Text("Report comment"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a reason: ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownMenuFormField(
              validator: (value) {
                return AppValidator.requiredValidator(value, 'reason');
              },
              width: MediaQuery.of(context).size.width / 1.5,
              hintText: "Select a reason",
              onSelected: selectReason,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: "spam", label: "Spam"),
                DropdownMenuEntry(value: "irrelevant", label: "Irrelevant"),
                DropdownMenuEntry(value: 'violence', label: "Violence"),
                DropdownMenuEntry(value: 'sexual', label: "Sexual Activities"),
              ],
            ),

            16.heightBox,
            Text(
              "Enter your message: ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextFormField(
                controller: messageController,
                maxLines: 3,
                validator: (value) {
                  return AppValidator.requiredValidator(value, 'message');
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            AppRouterHelper.pop(false);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              ColorPalette.error.withValues(alpha: 0.2),
            ),
          ),
          onPressed: () {
            reportComment();
          },
          child: state.value?.isReportLoading ?? false
              ? CupertinoActivityIndicator()
              : Text(
                  "Report",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: ColorPalette.error),
                ),
        ),
      ],
    );
  }
}
