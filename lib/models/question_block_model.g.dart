// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionBlockModel _$QuestionBlockModelFromJson(Map<String, dynamic> json) =>
    _QuestionBlockModel(
      data: json['data'] as Map<String, dynamic>,
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      indent: (json['indent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuestionBlockModelToJson(_QuestionBlockModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'indent': instance.indent,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.text: 'text',
  QuestionType.markdown: 'markdown',
  QuestionType.list: 'list',
  QuestionType.image: 'image',
  QuestionType.math: 'math',
  QuestionType.html: 'html',
  QuestionType.code: 'code',
};
