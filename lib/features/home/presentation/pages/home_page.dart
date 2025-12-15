import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/features/home/presentation/providers/course_provider.dart';
import 'package:question_hub/features/home/presentation/providers/home_provider.dart';
import 'package:question_hub/theme/color_palette.dart';

import '../../../../utils/ui/app_horizontal_divider.dart';
import '../../data/models/subject_model.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return state.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(child: Text('No questions found'));
        }
        return ListView.builder(
          itemCount: data.keys.length,
          shrinkWrap: true,
          // shrinkWrap: true,
          itemBuilder: (context, index) {
            final key = data.keys.toList()[index];
            final subjects = data[key] ?? [];

            return YearWiseSubjectWidget(subjects: subjects, semester: key);

            // return QuestionCard(question: question);
          },
        );
      },
      error: (err, st) {
        return Center(child: Text(err.toString()));
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class YearWiseSubjectWidget extends StatelessWidget {
  YearWiseSubjectWidget({
    super.key,
    required this.subjects,
    required this.semester,
  });

  List<SubjectModel> subjects;
  int semester;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final courseNotifier = ref.watch(courseProvider);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(
                "${courseNotifier.type.text}: $semester",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          },
        ),

        ListView.separated(
          itemCount: subjects.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return ListTile(
              onTap: () {
                print("clicked");
                context.router.push(QuestionsRoute(subject: subject));
              },
              title: Text(subject.name),
            );
          },
          separatorBuilder: (context, index) {
            return AppHorizontalDivider(color: ColorPalette.disabled);
          },
        ),
        AppHorizontalDivider(color: ColorPalette.disabled),
      ],
    );
  }
}
