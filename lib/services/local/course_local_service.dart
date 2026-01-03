import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/database/app_database.dart';

final courseLocalService = Provider(
  (ref) => CourseLocalService(ref.watch(localDatabaseProvider)),
);

class CourseLocalService {
  final AppDatabase _database;

  CourseLocalService(this._database);

  Future<void> saveSelectedCourse(CourseTableData course) async {
    final existingCourse = await _database
        .select(_database.courseTable)
        .getSingleOrNull();

    if (existingCourse == null) {
      await _database.delete(_database.courseTable).go();
      await _database.into(_database.courseTable).insert(course);
    } else {
      await _database.update(_database.courseTable).write(course);
    }
  }

  Future<CourseTableData?> getSelectedCourse() async {
    final course = await _database
        .select(_database.courseTable)
        .getSingleOrNull();

    print(course);

    return course;
  }
}
