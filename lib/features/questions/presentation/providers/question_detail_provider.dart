import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:question_hub/core/common/image_picker_utils.dart';
import 'package:question_hub/features/questions/data/repository/comment_repository_impl.dart';
import 'package:question_hub/features/questions/domain/repository/comment_repository.dart';
import 'package:question_hub/models/comment_model.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

import '../../../auth/presentation/providers/user_provider.dart';
import '../states/question_detail_state.dart';

final questionDetailProvider = AsyncNotifierProvider.family
    .autoDispose<QuestionDetailProvider, QuestionDetailState, String>(
      (questionId) => QuestionDetailProvider(questionId: questionId),
    );

class QuestionDetailProvider extends AsyncNotifier<QuestionDetailState> {
  final String questionId;
  late final CommentRepository _commentRepository;

  QuestionDetailProvider({required this.questionId});

  @override
  Future<QuestionDetailState> build() async {
    _commentRepository = ref.watch(commentRepositoryProvider);

    // fetch the comments
    final comments = await _commentRepository.fetchComments(
      questionId: questionId,
    );

    log(comments.data.toString());

    return QuestionDetailState(commentData: comments.data ?? []);
  }

  Future<void> pickCommentImage() async {
    final pickedFile = await ImagePickerUtil.pickImage(
      ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile == null) return;

    // check the size
    final sizeInBytes = await pickedFile.length();

    if (sizeInBytes > 1024 * 1024 * 2) {
      ToastService.e("Image size should be less than 2 mb");
      return;
    }

    String size;
    if (sizeInBytes / 1024 < 1024) {
      size = "${(sizeInBytes / 1024).toStringAsFixed(2)} KB";
    } else {
      size = "${(sizeInBytes / 1024 / 1024).toStringAsFixed(2)} MB";
    }

    setImage(pickedFile, size);
  }

  Future<void> addComment({
    required String content,
    required String userId,
    required String questionId,
  }) async {
    if (state.value?.isSendButtonLoading == true) {
      return;
    }

    state = AsyncData(state.value!.copyWith(isSendButtonLoading: true));

    final tempCommentData = CommentModel(
      id: 0,
      content: content,
      questionId: questionId,
      userId: userId,
      createdAt: DateTime.now().toString(),
      user: ref.read(userProvider)!,
      image: state.value?.selectedImage?.path,
    );

    print(tempCommentData);

    final response = await _commentRepository.addComment(
      content: content,
      userId: userId,
      questionId: questionId,
      image: state.value?.selectedImage,
    );

    if (response.isSuccess) {
      state = AsyncData(
        state.value!.copyWith(
          isSendButtonLoading: false,
          selectedImage: null,
          commentData: [
            response.data ?? tempCommentData,
            ...state.value!.commentData,
          ],
        ),
      );
    } else {
      state = AsyncData(state.value!.copyWith(isSendButtonLoading: false));
      log(response.error ?? '');
      ToastService.e("Unable to comment");
    }
  }

  Future<void> deleteComment({required int commentId}) async {
    // start loading
    state = AsyncData(state.value!.copyWith(isDeleteLoading: true));

    final response = await _commentRepository.deleteComment(
      commentId: commentId,
    );

    final newData = state.value!.commentData
        .where((element) => element.id != commentId)
        .toList();

    // end loading
    state = AsyncData(
      state.value!.copyWith(
        isDeleteLoading: false,
        commentData: response.isSuccess ? newData : state.value!.commentData,
      ),
    );

    if (response.isSuccess) {
      ToastService.s(response.data ?? 'Comment deleted!');
    } else {
      ToastService.e("Unable to delete comment");
    }
  }

  Future<void> reportComment({
    required int commentId,
    required String reason,
    required String content,
    required String userId,
  }) async {
    // start loading
    state = AsyncData(state.value!.copyWith(isReportLoading: true));

    final response = await _commentRepository.reportComment(
      commentId: commentId,
      reason: reason,
      content: content,
      userId: userId,
    );

    // end loading
    state = AsyncData(state.value!.copyWith(isReportLoading: false));

    if (response.isSuccess) {
      ToastService.s(response.data ?? 'Comment reported!');
    } else {
      ToastService.e("Unable to report comment");
    }
  }

  void setImage(File? file, String? size) {
    state = AsyncData(
      state.value!.copyWith(selectedImage: file, imageSize: size),
    );
  }
}
