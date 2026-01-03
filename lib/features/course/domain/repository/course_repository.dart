import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/models/course_model.dart';

abstract class CourseRepository {
  Future<Result<List<CourseModel>>> getAvailableCourses();

  Future<Result<bool>> saveSelectedCourse(CourseModel course);

  Future<Result<CourseModel?>> getSelectedCourse();
}
