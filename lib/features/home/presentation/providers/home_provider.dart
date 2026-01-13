import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/response/result_states.dart';
import 'package:question_hub/features/course/presentation/providers/course_provider.dart';
import 'package:question_hub/features/home/data/repository/home_repository_impl.dart';
import 'package:question_hub/features/home/domain/repository/home_repository.dart';

import '../../../../models/subject_model.dart';

final homeProvider = AsyncNotifierProvider(() => HomeProvider());

class HomeProvider extends AsyncNotifier<Map<int, List<SubjectModel>>> {
  late HomeRepository _homeRepository;

  @override
  Future<Map<int, List<SubjectModel>>> build() async {
    _homeRepository = ref.watch(homeRepositoryProvider);
    final courseData = ref.watch(courseProvider);
    final subjects = await getCourseSubjects(
      courseData.value!.selectedCourse!.id,
    );

    final response = formatSubjectBasedOnSemester(subjects);
    return response;
  }

  Future<List<SubjectModel>> getCourseSubjects(int courseId) async {
    final data = await _homeRepository.getCourseSubjects(courseId);

    if (data is Success) {
      return data.data!;
    }

    return Future.error(data.error ?? 'Unable to fetch subjects');
  }

  Map<int, List<SubjectModel>> formatSubjectBasedOnSemester(
    List<SubjectModel> subjects,
  ) {
    Map<int, List<SubjectModel>> subjectMappedWithYear = {};

    for (int i = 0; i < subjects.length; i++) {
      final subject = subjects[i];

      if (subjectMappedWithYear.containsKey(subject.level)) {
        subjectMappedWithYear[subject.level]!.add(subject);
      } else {
        subjectMappedWithYear.putIfAbsent(subject.level, () => [subject]);
      }
    }

    return subjectMappedWithYear;
  }
}
