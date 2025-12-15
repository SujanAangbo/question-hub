import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionModel({
    String? id,
    String? question,
    String? table,
    String? image,
    String? trailing,
    String? marks,
    String? createdAt,
    String? updatedAt,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
