import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/models/question_block_model.dart';

part 'doubt_question_model.freezed.dart';
part 'doubt_question_model.g.dart';

@freezed
abstract class DoubtQuestionModel with _$DoubtQuestionModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DoubtQuestionModel({
    required String id,
    required List<QuestionBlockModel> content,
    required String marks,
    required bool isSolved,
    required String createdAt,
    required String updatedAt,
  }) = _DoubtQuestionModel;

  factory DoubtQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$DoubtQuestionModelFromJson(json);
}
