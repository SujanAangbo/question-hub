import 'package:question_hub/core/response/result.dart';

import '../../../../models/subject_model.dart';

abstract class HomeRepository {
  Future<Result<List<SubjectModel>>> getCourseSubjects(int id);
}
