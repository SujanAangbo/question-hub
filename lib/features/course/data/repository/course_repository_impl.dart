import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/course/domain/repository/course_repository.dart';
import 'package:question_hub/models/course_model.dart';
import 'package:question_hub/services/local/course_local_service.dart';
import 'package:question_hub/services/remote/course_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final courseRepositoryProvider = Provider(
  (ref) => CourseRepositoryImpl(
    courseService: ref.watch(courseServiceProvider),
    courseLocalService: ref.watch(courseLocalService),
  ),
);

class CourseRepositoryImpl implements CourseRepository {
  final CourseService _courseService;
  final CourseLocalService _courseLocalService;

  CourseRepositoryImpl({
    required CourseService courseService,
    required CourseLocalService courseLocalService,
  }) : _courseService = courseService,
       _courseLocalService = courseLocalService;

  @override
  Future<Result<List<CourseModel>>> getAvailableCourses() async {
    try {
      final courses = await _courseService.getAllCourses();
      return Result.success(courses);
    } on PostgrestException catch (e) {
      return Result.error(e.message);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> saveSelectedCourse(CourseModel course) async {
    try {
      print('saving course');
      final selectedCourseData = CourseTableData.fromJson(course.toJson());
      await _courseLocalService.saveSelectedCourse(selectedCourseData);
      return Result.success(true);
    } on DriftWrappedException catch (e) {
      print(e.message);
      return Result.error(e.message);
    } catch (e) {
      print(e.toString());
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<CourseModel?>> getSelectedCourse() async {
    try {
      final response = await _courseLocalService.getSelectedCourse();

      if (response == null) {
        return Result.success(null);
      }

      final selectedCourse = CourseModel.fromJson(response.toJson());
      return Result.success(selectedCourse);
    } on DriftWrappedException catch (e) {
      print(e.message);
      return Result.error(e.message);
    } catch (e) {
      print(e.toString());
      return Result.error(e.toString());
    }
  }
}
