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

import '../../../../models/subject_model.dart';
import '../../../../utils/ui/app_horizontal_divider.dart';
import '../widgets/home_header.dart';
import '../widgets/subject_list_shimmer.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return FocusScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionHubHeader(),
            state.when(
              data: (data) {
                if (data.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: Text(
                        'No subjects found',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: data.keys.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final key = data.keys.toList()[index];
                    final subjects = data[key] ?? [];

                    return YearWiseSubjectWidget(
                      subjects: subjects,
                      semester: key,
                    );
                  },
                );
              },
              error: (err, st) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(child: Text(err.toString())),
                );
              },
              loading: () {
                return SubjectListShimmer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YearWiseSubjectWidget extends StatelessWidget {
  YearWiseSubjectWidget({super.key, required this.subjects, this.semester});

  List<SubjectModel> subjects;
  int? semester;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (semester != null)
          Consumer(
            builder: (context, ref, child) {
              final courseNotifier = ref.watch(courseProvider);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: RichText(
                  text: TextSpan(
                    text:
                        "${courseNotifier.value?.selectedCourse?.type.text}: ",
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
              ),
              subtitle: Text(
                '4 years questions',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
