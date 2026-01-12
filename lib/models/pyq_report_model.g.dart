// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pyq_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PyqReportModel _$PyqReportModelFromJson(Map<String, dynamic> json) =>
    _PyqReportModel(
      id: json['id'] as String,
      course: (json['course'] as num).toInt(),
      subject: (json['subject'] as num).toInt(),
      message: json['message'] as String,
      year: (json['year'] as num?)?.toInt(),
      batch: (json['batch'] as num?)?.toInt(),
      sn: (json['sn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PyqReportModelToJson(_PyqReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course': instance.course,
      'subject': instance.subject,
      'message': instance.message,
      'year': instance.year,
      'batch': instance.batch,
      'sn': instance.sn,
    };
