import 'package:auto_route/auto_route.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: BottomNavBar.page,
      initial: true,
      path: '/bottom_nav',
      children: [
        AutoRoute(page: HomeRoute.page, path: "home"),
        AutoRoute(page: BookmarkRoute.page, path: 'bookmark'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
    AutoRoute(page: QuestionsRoute.page, path: '/questions'),
  ];
}
