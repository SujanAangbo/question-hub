import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/models/user_model.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
abstract class CommentModel with _$CommentModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CommentModel({
    required int id,
    required String questionId,
    required String userId,
    required String content,
    required UserModel user,
    String? image,
    String? createdAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
