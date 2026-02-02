import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';
import 'package:question_hub/models/comment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

final commentServiceProvider = Provider((ref) {
  return CommentService(supabaseClient);
});

class CommentService {
  final SupabaseClient _supabaseClient;

  CommentService(this._supabaseClient);

  Future<List<CommentModel>> fetchComments(String questionId) async {
    final response = await _supabaseClient
        .from(SupabaseConstants.commentsTable)
        .select("*, user: ${SupabaseConstants.usersTable}(*)")
        .eq('question_id', questionId)
        .order('created_at');

    final comments = response
        .map((data) => CommentModel.fromJson(data))
        .toList();

    return comments;
  }

  Future<CommentModel> addComment({
    required String content,
    required String userId,
    required String questionId,
    File? image,
  }) async {
    String? imageUrl;

    // uploading image
    if (image != null) {
      final imageName = Uuid().v4();
      await _supabaseClient.storage
          .from(SupabaseConstants.commentBucket)
          .upload(imageName, image);

      imageUrl = _supabaseClient.storage
          .from(SupabaseConstants.commentBucket)
          .getPublicUrl(imageName);
    }

    // creating comment
    final data = {
      'content': content,
      'user_id': userId,
      'question_id': questionId,
      'image': imageUrl,
    };
    final response = await _supabaseClient
        .from(SupabaseConstants.commentsTable)
        .insert(data)
        .select("*, user: ${SupabaseConstants.usersTable}(*)")
        .single();

    log("insert response: $response");

    return CommentModel.fromJson(response);
  }

  Future<void> deleteComment({required int commentId}) async {
    final response = await _supabaseClient
        .from(SupabaseConstants.commentsTable)
        .delete()
        .eq('id', commentId)
        .select()
        .single();

    final imageUrl = response['image'] as String?;

    if (imageUrl != null) {
      await _supabaseClient.storage
          .from(SupabaseConstants.commentBucket)
          .remove([imageUrl.split('/').last]);
    }
  }

  Future<void> reportComment({
    required int commentId,
    required String reason,
    required String content,
    required String userId,
  }) async {
    final data = {
      'comment_id': commentId,
      'reason': reason,
      'message': content,
      'reported_by': userId,
    };

    await _supabaseClient
        .from(SupabaseConstants.commentReportTable)
        .insert(data);
  }
}
