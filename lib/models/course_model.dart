import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/core/enums/course_type.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
abstract class CourseModel with _$CourseModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CourseModel({
    required int id,
    required String name,
    String? description,
    required CourseType type,
    required int years,
    int? ch,
    String? code,
    String? createdAt,
    String? updatedAt,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}
