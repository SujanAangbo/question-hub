import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/models/question_block_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionModel({
    required String id,
    required List<QuestionBlockModel> content,
    required String marks,
    required String createdAt,
    required String updatedAt,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
