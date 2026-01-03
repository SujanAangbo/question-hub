import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:question_hub/models/course_model.dart';

part 'course_state.freezed.dart';

@freezed
abstract class CourseState with _$CourseState {
  factory CourseState({
    required CourseModel? selectedCourse,
    @Default([]) List<CourseModel> courses,
  }) = _CourseState;
}
