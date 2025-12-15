// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) =>
    _SubjectModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      ch: (json['ch'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      course: (json['course'] as num).toInt(),
      code: json['code'] as String,
      groupTitle: json['group_title'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SubjectModelToJson(_SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ch': instance.ch,
      'level': instance.level,
      'course': instance.course,
      'code': instance.code,
      'group_title': instance.groupTitle,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
