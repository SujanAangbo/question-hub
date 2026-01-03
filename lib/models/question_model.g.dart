// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: json['id'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => QuestionBlockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      marks: json['marks'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'marks': instance.marks,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
