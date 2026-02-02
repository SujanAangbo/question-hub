import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/features/auth/presentation/providers/splash_provider.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashProvider, (_, next) {
      next.whenData((destination) {
        switch (destination) {
          case SplashDestination.onboarding:
            context.router.replace(const OnboardingRoute());
            break;
          case SplashDestination.home:
            context.router.replace(const BottomNavBar());
            break;
          case SplashDestination.bookmark:
            context.router.replace(const BookmarkRoute());
            break;
          case SplashDestination.noInternet:
            context.router.replace(const NoInternetRoute());
            break;
          case SplashDestination.login:
            context.router.replace(EmailLoginRoute(isPopAble: false));
            break;
        }
      });
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
