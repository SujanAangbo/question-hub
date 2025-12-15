import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/enums/course_type.dart';
import 'package:question_hub/features/home/data/models/course_model.dart';

final courseProvider = Provider(
  (ref) => CourseModel(
    id: 4,
    name: "BCA",
    type: CourseType.semester,
    ch: 120,
    years: 4,
    code: "BCA",
  ),
);
