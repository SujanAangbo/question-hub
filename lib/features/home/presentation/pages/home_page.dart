import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/core/common/color_utils.dart';
import 'package:question_hub/features/course/presentation/providers/course_provider.dart';
import 'package:question_hub/features/home/presentation/providers/home_provider.dart';
import 'package:question_hub/theme/color_palette.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../models/subject_model.dart';
import '../../../../utils/ui/app_horizontal_divider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return FocusScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                color: ColorPalette.primary.withAlpha(100),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.school_outlined,
                            size: 40,
                            color: ColorPalette.white,
                          ),
                        ),
                        16.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Question Hub",
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(letterSpacing: 2),
                            ),
                            Text(
                              "Previous Year Questions",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                    16.heightBox,
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorPalette.hintColor,
                        ),
                        hintText: "Search Subject...",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: ColorPalette.white,
                      ),
                    ),
                  ],
                ),
              ),
              state.when(
                data: (data) {
                  if (data.isEmpty) {
                    return Center(child: Text('No questions found'));
                  }
                  return ListView.builder(
                    itemCount: data.keys.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final key = data.keys.toList()[index];
                      final subjects = data[key] ?? [];

                      return YearWiseSubjectWidget(
                        subjects: subjects,
                        semester: key,
                      );

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
              ),
            ],
          ),
        ),
      ),
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
              child: RichText(
                text: TextSpan(
                  text: "${courseNotifier.value?.selectedCourse?.type.text}: ",
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: [
                    TextSpan(
                      text: '$semester',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        AppHorizontalDivider(color: ColorPalette.disabled),

        ListView.separated(
          itemCount: subjects.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final subject = subjects[index];
            Color subjectColor = subject.color == null
                ? Colors.blue
                : hexToColor(subject.color!);
            return ListTile(
              minTileHeight: 80,
              titleAlignment: ListTileTitleAlignment.center,
              leading: subject.icon != null
                  ? Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: subjectColor.withAlpha(50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.string(
                        subject.icon!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          subjectColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : null,
              onTap: () {
                print("clicked");
                context.router.push(QuestionsRoute(subject: subject));
              },
              title: Text(
                subject.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                '4 years questions',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
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
