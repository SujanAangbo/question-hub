import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';
import 'package:question_hub/models/course_model.dart';

final courseServiceProvider = Provider((ref) => CourseService());

class CourseService {
  Future<List<CourseModel>> getAllCourses() async {
    final response = await supabaseClient
        .from(SupabaseConstants.coursesTable)
        .select();

    return response
        .map((courseMap) => CourseModel.fromJson(courseMap))
        .toList();
  }
}
