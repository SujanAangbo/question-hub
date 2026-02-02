import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/models/comment_model.dart';

part 'question_detail_state.freezed.dart';

@freezed
abstract class QuestionDetailState with _$QuestionDetailState {
  const factory QuestionDetailState({
    required List<CommentModel> commentData,
    @Default(true) bool isSendButtonEnabled,
    File? selectedImage,
    String? imageSize,
    @Default(false) bool isSendButtonLoading,
    @Default(false) bool isReportLoading,
    @Default(false) bool isDeleteLoading,
    @Default(false) bool isReporting,
  }) = _QuestionDetailState;
}
