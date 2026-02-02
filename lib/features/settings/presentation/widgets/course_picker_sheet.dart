import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/app/routes/app_router.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/course/presentation/providers/course_provider.dart';
import 'package:question_hub/models/course_model.dart';

class CoursePickerSheet extends ConsumerStatefulWidget {
  const CoursePickerSheet({super.key});

  @override
  ConsumerState<CoursePickerSheet> createState() => _CoursePickerSheetState();
}

class _CoursePickerSheetState extends ConsumerState<CoursePickerSheet> {
  late final List<CourseModel> courses;
  late List<CourseModel> filtered;

  @override
  void initState() {
    final state = ref.read(courseProvider);
    courses = filtered = state.value?.courses ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    final courseState = ref.watch(courseProvider);

    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFD0D0D0),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose your course',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    AppRouterHelper.pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search course',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  filtered = courses
                      .where(
                        (c) =>
                            c.name.toLowerCase().contains(value.toLowerCase()),
                      )
                      .toList();
                });
              },
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final course = filtered[i];
                  final isSelected =
                      course == courseState.value!.selectedCourse;

                  return ListTile(
                    title: Text(course.name),
                    trailing: isSelected
                        ? const Icon(Icons.check, color: Color(0xFF1E3A8A))
                        : null,
                    onTap: () {
                      ref
                          .read(courseProvider.notifier)
                          .updateSelectedCourse(course);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
