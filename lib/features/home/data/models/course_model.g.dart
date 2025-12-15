// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => _CourseModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  type: $enumDecode(_$CourseTypeEnumMap, json['type']),
  ch: (json['ch'] as num).toInt(),
  years: (json['years'] as num).toInt(),
  code: json['code'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$CourseModelToJson(_CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$CourseTypeEnumMap[instance.type]!,
      'ch': instance.ch,
      'years': instance.years,
      'code': instance.code,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$CourseTypeEnumMap = {
  CourseType.semester: 'semester',
  CourseType.year: 'year',
};
