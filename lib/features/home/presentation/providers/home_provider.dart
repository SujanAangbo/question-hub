import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/response/result_states.dart';
import 'package:question_hub/features/home/data/models/subject_model.dart';
import 'package:question_hub/features/home/data/repository/home_repository_impl.dart';
import 'package:question_hub/features/home/domain/repository/home_repository.dart';

final homeProvider = AsyncNotifierProvider(() => HomeProvider());

class HomeProvider extends AsyncNotifier<Map<int, List<SubjectModel>>> {
  late HomeRepository _homeRepository;

  @override
  Future<Map<int, List<SubjectModel>>> build() async {
    print("over here");
    _homeRepository = ref.watch(homeRepositoryProvider);
    final subjects = await getCourseSubjects(4);

    final response = formatSubjectBasedOnSemester(subjects);

    log(response.toString());

    return response;
  }

  Future<List<SubjectModel>> getCourseSubjects(int courseId) async {
    final data = await _homeRepository.getCourseSubjects(courseId);

    print("data: $data");
    if (data is Success) {
      return data.data!;
    }

    return Future.error(data.error ?? 'Unable to fetch questions');
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
