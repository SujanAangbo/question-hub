import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/questions/presentation/providers/pyq_questions_provider.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../models/pyq_model.dart';
import '../../../../models/subject_model.dart';
import '../../../../theme/color_palette.dart';
import '../widgets/group_question_widget.dart';
import '../widgets/question_list_shimmer.dart';

@RoutePage()
class QuestionsPage extends ConsumerWidget {
  QuestionsPage({super.key, required this.subject});

  final SubjectModel subject;
  late Map<String, List<PyqModel>>? questionData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pyqQuestionProvider(subject.id));

    // final fontData = await rootBundle.load('assets/fonts/OpenSans-Regular.ttf');

    return Scaffold(
      appBar: DefaultAppBar(title: subject.name.toString()),
      body: state.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(child: Text('No questions found'));
          }

          questionData = data;

          return DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
              inherit: true,
            ),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final key = data.keys.toList()[index];
                final pyq = data[key] ?? [];

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorPalette.info,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          key,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontFamily: "Inter"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      8.heightBox,
                      GroupQuestionWidgetPdf(questions: pyq),
                    ],
                  ),
                );
              },
            ),
          );
        },
        error: (err, st) {
          return Center(
            child: Text(
              err.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        },
        loading: () {
          return QuestionListShimmer();
        },
      ),
    );
  }
}
