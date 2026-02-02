import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/app/routes/app_router.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/questions/presentation/providers/question_detail_provider.dart';
import 'package:question_hub/features/questions/presentation/widgets/pyq_question_card.dart';
import 'package:question_hub/models/pyq_model.dart';
import 'package:question_hub/theme/color_palette.dart';
import 'package:question_hub/utils/ui/app_horizontal_divider.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/sized_box.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

import '../../../../utils/ui/default_app_bar.dart';
import '../widgets/comment_card.dart';

@RoutePage()
class QuestionDetailPage extends ConsumerStatefulWidget {
  QuestionDetailPage({super.key, required this.question});

  final PyqModel question;

  @override
  ConsumerState<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends ConsumerState<QuestionDetailPage> {
  final commentController = TextEditingController();

  Future<void> comment() async {
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

    final provider = ref.read(
      questionDetailProvider(widget.question.question.id).notifier,
    );

    await provider.addComment(
      content: commentController.text.trim(),
      userId: authenticatedUser?.id ?? '',
      questionId: widget.question.question.id,
    );

    commentController.clear();
  }

  Future<void> pickImage() async {
    final provider = ref.read(
      questionDetailProvider(widget.question.question.id).notifier,
    );

    await provider.pickCommentImage();
  }

  void clearImage() {
    final provider = ref.read(
      questionDetailProvider(widget.question.question.id).notifier,
    );
    provider.setImage(null, null);
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      questionDetailProvider(widget.question.question.id),
    );

    return FocusScaffold(
      appBar: DefaultAppBar(title: "Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PYQQuestionCard(pyq: widget.question),
              8.heightBox,
              AppHorizontalDivider(),
              8.heightBox,
              Text(
                "Comments(${state.value?.commentData.length ?? 0}): ",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontSize: 20),
              ),
              8.heightBox,
              8.heightBox,
              state.when(
                data: (data) {
                  if (data.commentData.isEmpty) {
                    return Text("No comments yet");
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.commentData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final comment = data.commentData[index];
                      return CommentCard(comment: comment);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return AppHorizontalDivider(height: 16);
                    },
                  );
                },
                error: (err, st) {
                  return Text("Error: $err");
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.value?.selectedImage != null)
              ListTile(
                minTileHeight: 60,
                contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPalette.grey),
                ),
                leading: Image.file(
                  state.value!.selectedImage!,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                title: Text(path.basename(state.value!.selectedImage!.path)),
                subtitle: Text(state.value!.imageSize ?? ''),
                trailing: InkWell(
                  onTap: clearImage,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      // color: Theme.of(context).colorScheme.outline,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            8.heightBox,
            Row(
              children: [
                IconButton(
                  padding: EdgeInsetsGeometry.zero,
                  onPressed: pickImage,
                  icon: Icon(
                    Icons.attach_file,
                    size: 26,
                    color: ColorPalette.outline,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: commentController,
                      maxLines: 4,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsGeometry.symmetric(
                          horizontal: 8,
                        ),
                      ),
                    ),
                  ),
                ),
                8.widthBox,
                InkWell(
                  onTap: comment,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorPalette.grey,
                      shape: BoxShape.circle,
                    ),
                    child: state.value?.isSendButtonLoading ?? false
                        ? CupertinoActivityIndicator()
                        : Icon(Icons.send, color: ColorPalette.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
