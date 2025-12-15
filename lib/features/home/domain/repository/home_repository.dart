import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/home/data/models/subject_model.dart';

abstract class HomeRepository {
  Future<Result<List<SubjectModel>>> getCourseSubjects(int id);
}
