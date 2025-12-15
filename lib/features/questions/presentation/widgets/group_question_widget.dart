import 'package:flutter/material.dart';
import 'package:question_hub/features/questions/presentation/widgets/year_wise_question_widget.dart';

import '../../../home/data/models/pyq_model.dart';

class GroupQuestionWidgetPdf extends StatelessWidget {
  final List<PyqModel> questions;
  final Map<int, List<PyqModel>> groupQuestions;

  GroupQuestionWidgetPdf({super.key, required this.questions})
    : groupQuestions = _groupQuestions(questions);

  static Map<int, List<PyqModel>> _groupQuestions(List<PyqModel> questions) {
    final Map<int, List<PyqModel>> map = {};
    for (var q in questions) {
      map.putIfAbsent(q.group, () => []).add(q);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupQuestions.entries.map((entry) {
        final key = entry.key;
        final groupQuestion = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Group: $key",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),

            // Add your question widgets here
            YearWiseQuestionWidgetPdf(questions: groupQuestion),
          ],
        );
      }).toList(),
    );
  }
}
