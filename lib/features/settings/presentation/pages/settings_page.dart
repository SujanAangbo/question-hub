import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/course/presentation/providers/course_provider.dart';
import 'package:question_hub/features/settings/presentation/providers/theme_provider.dart';
import 'package:question_hub/models/course_model.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusScaffold(
      appBar: DefaultAppBar(title: "Settings"),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "My Course",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                16.widthBox,
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final provider = ref.watch(courseProvider);
                      return DropdownButton<CourseModel>(
                        value: provider.value?.selectedCourse,
                        isExpanded: true,
                        items: provider.value?.courses
                            .map(
                              (course) => DropdownMenuItem(
                                value: course,
                                child: Text(
                                  course.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          ref
                              .read(courseProvider.notifier)
                              .updateSelectedCourse(value);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            16.heightBox,
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Dark Mode",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                16.widthBox,
                Consumer(
                  builder: (context, ref, child) {
                    final provider = ref.watch(themeProvider);
                    return Switch(
                      value: provider.value!,
                      onChanged: (value) {
                        ref.read(themeProvider.notifier).updateTheme = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
