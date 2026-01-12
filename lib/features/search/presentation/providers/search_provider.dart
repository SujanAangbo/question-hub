import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/features/home/presentation/providers/home_provider.dart';
import 'package:question_hub/models/subject_model.dart';

final searchProvider = StateNotifierProvider((ref) {
  final yearWiseSubject = ref.watch(homeProvider).value;

  if (yearWiseSubject == null) {
    return SearchProvider(courses: []);
  }

  return SearchProvider(
    courses: yearWiseSubject.values.expand((element) => element).toList(),
  );
});

class SearchProvider extends StateNotifier<List<SubjectModel>> {
  final List<SubjectModel> courses;
  SearchProvider({required this.courses}) : super(courses);
  // @override
  // FutureOr<List<SubjectModel>> build() {
  //   final
  //   final yearWiseSubject = ref.watch(homeProvider).value;
  //
  //   if (yearWiseSubject == null) {
  //     return [];
  //   }
  //
  //   return yearWiseSubject.values.expand((element) => element).toList();
  //
  // }

  void search(String query) {
    state = courses
        .where(
          (course) => course.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
