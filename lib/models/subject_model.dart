import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_model.freezed.dart';
part 'subject_model.g.dart';

@freezed
abstract class SubjectModel with _$SubjectModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SubjectModel({
    required int id,
    required String name,
    String? description,
    required int ch,
    required int level,
    required int course,
    required String code,
    String? icon,
    String? color,
    String? groupTitle,
    String? createdAt,
    String? updatedAt,
  }) = _SubjectModel;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
}
