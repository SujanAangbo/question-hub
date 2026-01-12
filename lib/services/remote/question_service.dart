import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';

import '../../models/pyq_model.dart';
import '../../models/question_model.dart';
import '../../models/subject_model.dart';

final questionServiceProvider = Provider((ref) => QuestionService());

class QuestionService {
  Future<List<QuestionModel>> getAllQuestions() async {
    final response = await supabaseClient
        .from(SupabaseConstants.questionsTable)
        .select();

    return response
        .map((questionMap) => QuestionModel.fromJson(questionMap))
        .toList();
  }

  Future<List<dynamic>> getAllQuestion() async {
    final response = await supabaseClient.from('question').select();

    return response;

    // return response
    //     .map((questionMap) => QuestionModel.fromJson(questionMap))
    //     .toList();
  }

  Future<List<PyqModel>> getSubjectQuestions(int subjectId) async {
    final response = await supabaseClient
        .from(SupabaseConstants.pyqTable)
        .select(
          'id, course, subject, batch, created_at, updated_at, sn, '
          'group, year, question!inner(*) as question',
        )
        .eq('subject', subjectId)
        .order('year')
        .order('batch')
        .order('sn', ascending: true);

    log("result: $response");

    final questions = response.map((questionMap) {
      final question = PyqModel.fromJson(questionMap);
      print("question: $question");
      return question;
    }).toList();

    log("response: $questions");
    return questions;
  }

  Future<List<SubjectModel>> getCourseSubjects(int courseId) async {
    final response = await supabaseClient
        .from(SupabaseConstants.subjectsTable)
        .select()
        .eq('course', courseId)
        .order('level', ascending: true);

    return response
        .map((questionMap) => SubjectModel.fromJson(questionMap))
        .toList();
  }
}
