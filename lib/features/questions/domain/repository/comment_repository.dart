import 'dart:io';

import 'package:question_hub/core/response/result.dart';

import '../../../../models/comment_model.dart';

abstract class CommentRepository {
  Future<Result<List<CommentModel>>> fetchComments({
    required String questionId,
  });

  Future<Result<CommentModel>> addComment({
    required String content,
    required String userId,
    required String questionId,
    File? image,
  });

  Future<Result<String>> deleteComment({required int commentId});

  Future<Result<String>> reportComment({
    required int commentId,
    required String reason,
    required String content,
    required String userId,
  });
}
