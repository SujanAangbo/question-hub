import 'package:flutter/material.dart';
import 'package:question_hub/features/questions/presentation/widgets/pyq_question_card.dart';

import '../../../../models/pyq_model.dart';

class YearWiseQuestionWidgetPdf extends StatelessWidget {
  const YearWiseQuestionWidgetPdf({super.key, required this.questions});

  final List<PyqModel> questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: questions.map((pyq) {
        return PYQQuestionCard(pyq: pyq);
      }).toList(),
    );
  }
}
