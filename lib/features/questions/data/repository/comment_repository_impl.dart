import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/models/comment_model.dart';
import 'package:question_hub/services/remote/comment_service.dart';

import '../../domain/repository/comment_repository.dart';

final commentRepositoryProvider = Provider((ref) {
  return CommentRepositoryImpl(
    commentService: ref.read(commentServiceProvider),
  );
});

class CommentRepositoryImpl implements CommentRepository {
  final CommentService _commentService;

  CommentRepositoryImpl({required CommentService commentService})
    : _commentService = commentService;

  @override
  Future<Result<CommentModel>> addComment({
    required String content,
    required String userId,
    required String questionId,
    File? image,
  }) async {
    try {
      final response = await _commentService.addComment(
        content: content,
        userId: userId,
        questionId: questionId,
        image: image,
      );

      return Result.success(response);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<String>> deleteComment({required int commentId}) async {
    try {
      final _ = await _commentService.deleteComment(commentId: commentId);

      return Result.success("Comment deleted successfully");
    } catch (e, st) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<CommentModel>>> fetchComments({
    required String questionId,
  }) async {
    try {
      final response = await _commentService.fetchComments(questionId);

      return Result.success(response);
    } catch (e, st) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<String>> reportComment({
    required int commentId,
    required String reason,
    required String content,
    required String userId,
  }) async {
    try {
      final response = await _commentService.reportComment(
        commentId: commentId,
        reason: reason,
        content: content,
        userId: userId,
      );

      return Result.success("Comment reported!");
    } catch (e, st) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }
}
