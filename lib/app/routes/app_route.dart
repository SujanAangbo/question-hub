import 'package:auto_route/auto_route.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: BottomNavBar.page,
      path: '/bottom_nav',
      children: [
        AutoRoute(page: HomeRoute.page, path: "home"),
        AutoRoute(page: BookmarkRoute.page, path: 'bookmark'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
    AutoRoute(page: QuestionsRoute.page, path: '/questions'),
    AutoRoute(page: QuestionDetailRoute.page, path: '/questions_detail'),
    AutoRoute(page: DemoUi.page, path: '/demo'),
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
    AutoRoute(page: NoInternetRoute.page, path: '/no_internet'),
    AutoRoute(page: BookmarkRoute.page, path: '/bookmark'),
    AutoRoute(page: EmailLoginRoute.page, path: '/email_login'),
    AutoRoute(page: EmailSignupRoute.page, path: '/email_signup'),
    AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot_password'),
    AutoRoute(page: ResetPasswordRoute.page, path: '/reset_password'),
    AutoRoute(page: OtpRoute.page, path: '/otp'),
    AutoRoute(page: SearchRoute.page, path: '/search'),
    AutoRoute(page: EditProfileRoute.page, path: '/edit_profile'),
    AutoRoute(page: ChangePasswordRoute.page, path: '/change_password'),
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
  ];
}
