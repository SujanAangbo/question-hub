import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/features/home/data/models/question_model.dart';

part 'pyq_model.freezed.dart';
part 'pyq_model.g.dart';

@freezed
abstract class PyqModel with _$PyqModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PyqModel({
    required int id,
    required int course,
    required int subject,
    required QuestionModel questions,
    int? batch,
    required int year,
    required int sn,
    required int group,
    String? createdAt,
    String? updatedAt,
  }) = _PyqModel;

  factory PyqModel.fromJson(Map<String, dynamic> json) =>
      _$PyqModelFromJson(json);
}
