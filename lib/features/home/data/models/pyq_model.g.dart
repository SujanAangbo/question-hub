// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pyq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PyqModel _$PyqModelFromJson(Map<String, dynamic> json) => _PyqModel(
  id: (json['id'] as num).toInt(),
  course: (json['course'] as num).toInt(),
  subject: (json['subject'] as num).toInt(),
  questions: QuestionModel.fromJson(json['questions'] as Map<String, dynamic>),
  batch: (json['batch'] as num?)?.toInt(),
  year: (json['year'] as num).toInt(),
  sn: (json['sn'] as num).toInt(),
  group: (json['group'] as num).toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$PyqModelToJson(_PyqModel instance) => <String, dynamic>{
  'id': instance.id,
  'course': instance.course,
  'subject': instance.subject,
  'questions': instance.questions,
  'batch': instance.batch,
  'year': instance.year,
  'sn': instance.sn,
  'group': instance.group,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
