import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:question_hub/core/common/snackbar.dart';
import 'package:question_hub/core/constants/app_assets.dart';
import 'package:question_hub/core/shared_preferences/app_preferences.dart';

import '../../../../app/routes/app_route.gr.dart';
import '../../../../models/course_model.dart';
import '../../../course/presentation/providers/course_provider.dart';

@RoutePage()
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntroductionScreen(
      done: Text("Done"),
      next: Text("Next"),
      onDone: () {
        if (ref.read(courseProvider).value?.selectedCourse == null) {
          showSnackBar(
            context: context,
            message: 'Select a course to continue',
            status: SnackBarStatus.error,
          );
          return;
        }
        ref.read(appPreferencesProvider).setFirstTimeFalse();
        context.router.pushAndPopUntil(
          BottomNavBar(),
          predicate: (route) => false,
        );
      },
      pages: [
        PageViewModel(
          decoration: PageDecoration(),
          title: "Start your journey!",
          body: "Get your previous year questions to increase your efficiency",
          image: Container(
            margin: EdgeInsets.only(top: 40),
            child: Image.asset(AppAssets.logoImage),
          ),
        ),
        PageViewModel(
          decoration: PageDecoration(bodyAlignment: Alignment.center),
          title: "Select your education details",
          bodyWidget: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final provider = ref.watch(courseProvider);
                  return DropdownButton<CourseModel>(
                    isExpanded: true,
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
                    hint: Text(
                      "Select your current course",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    value: provider.value?.selectedCourse,
                    items: provider.value?.courses
                        .map(
                          (course) => DropdownMenuItem(
                            value: course,
                            child: Text(
                              course.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
            ],
          ),
          // image: Image.network(
          //   'https://imgs.search.brave.com/GO8ZB_gMZoE28uWTwsOjitIQ-cvL5jrv1h_8nqpyG_g/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4t/ZnJvbnQuZnJlZXBp/ay5jb20vaG9tZS9h/bm9uLXJ2bXAvY3Jl/YXRpdmUtc3VpdGUv/c29jaWFsLW1lZGlh/L29uLWJyYW5kLndl/YnA',
          // ),
        ),
      ],
    );
  }
}
