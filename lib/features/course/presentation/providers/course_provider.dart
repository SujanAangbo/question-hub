import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/course/data/repository/course_repository_impl.dart';
import 'package:question_hub/features/course/domain/repository/course_repository.dart';
import 'package:question_hub/features/course/presentation/states/course_state.dart';

import '../../../../models/course_model.dart';

final courseProvider = AsyncNotifierProvider(() => CourseProvider());

class CourseProvider extends AsyncNotifier<CourseState> {
  late final CourseRepository _courseRepository;

  @override
  Future<CourseState> build() async {
    // fetch courses from server
    _courseRepository = ref.watch(courseRepositoryProvider);
    final courses = await _courseRepository.getAvailableCourses();

    // fetch selected course from local db
    final selectedCourse = await getSelectedCourse(courses.data ?? []);

    print("courses; $courses");
    print("courses; $selectedCourse");

    return CourseState(
      selectedCourse: selectedCourse,
      courses: courses.data ?? [],
    );
  }

  void updateSelectedCourse(CourseModel course) {
    state = AsyncData(state.value!.copyWith(selectedCourse: course));
    // store the course in local db
    _courseRepository.saveSelectedCourse(course);
  }

  /// get the last selected course by the user. Also checks the courses from
  /// the remote to whether that course is present or not. Is also helps to
  /// enable consistency even the remote course data are changed.
  Future<CourseModel?> getSelectedCourse(
    List<CourseModel> availableCourses,
  ) async {
    final selectedCourse = await _courseRepository.getSelectedCourse();

    if (selectedCourse.data == null) {
      return null;
    }

    final course = availableCourses
        .where((course) => course.id == selectedCourse.data!.id)
        .toList();

    if (course.isEmpty) {
      return null;
    }

    return course.first;
  }
}
