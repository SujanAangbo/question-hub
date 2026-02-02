// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: (json['id'] as num).toInt(),
      questionId: json['question_id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'user_id': instance.userId,
      'content': instance.content,
      'user': instance.user,
      'image': instance.image,
      'created_at': instance.createdAt,
    };
