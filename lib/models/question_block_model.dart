import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/core/enums/question_type.dart';

part 'question_block_model.freezed.dart';
part 'question_block_model.g.dart';

@freezed
abstract class QuestionBlockModel with _$QuestionBlockModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionBlockModel({
    required Map<String, dynamic> data,
    required QuestionType type,
    int? indent,
  }) = _QuestionBlockModel;

  factory QuestionBlockModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionBlockModelFromJson(json);
}
