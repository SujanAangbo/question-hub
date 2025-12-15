// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: json['id'] as String?,
      question: json['question'] as String?,
      table: json['table'] as String?,
      image: json['image'] as String?,
      trailing: json['trailing'] as String?,
      marks: json['marks'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'table': instance.table,
      'image': instance.image,
      'trailing': instance.trailing,
      'marks': instance.marks,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
