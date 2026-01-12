// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubt_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoubtQuestionModel _$DoubtQuestionModelFromJson(Map<String, dynamic> json) =>
    _DoubtQuestionModel(
      id: json['id'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => QuestionBlockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      marks: json['marks'] as String,
      courseId: (json['course_id'] as num).toInt(),
      isSolved: json['is_solved'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$DoubtQuestionModelToJson(_DoubtQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'marks': instance.marks,
      'course_id': instance.courseId,
      'is_solved': instance.isSolved,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
