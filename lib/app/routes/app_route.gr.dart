// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:question_hub/features/bookmark/presentation/pages/bookmark_page.dart'
    as _i1;
import 'package:question_hub/features/bottom_nav_bar/presentation/pages/bottom_nav_bar.dart'
    as _i2;
import 'package:question_hub/features/demo/demo_ui.dart' as _i3;
import 'package:question_hub/features/home/presentation/pages/home_page.dart'
    as _i4;
import 'package:question_hub/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i6;
import 'package:question_hub/features/questions/presentation/pages/questions_page.dart'
    as _i7;
import 'package:question_hub/features/settings/presentation/pages/no_internet_page.dart'
    as _i5;
import 'package:question_hub/features/settings/presentation/pages/settings_page.dart'
    as _i8;
import 'package:question_hub/features/splash/presentation/pages/splash_page.dart'
    as _i9;
import 'package:question_hub/models/subject_model.dart' as _i12;

/// generated route for
/// [_i1.BookmarkPage]
class BookmarkRoute extends _i10.PageRouteInfo<void> {
  const BookmarkRoute({List<_i10.PageRouteInfo>? children})
    : super(BookmarkRoute.name, initialChildren: children);

  static const String name = 'BookmarkRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.BookmarkPage();
    },
  );
}

/// generated route for
/// [_i2.BottomNavBar]
class BottomNavBar extends _i10.PageRouteInfo<void> {
  const BottomNavBar({List<_i10.PageRouteInfo>? children})
    : super(BottomNavBar.name, initialChildren: children);

  static const String name = 'BottomNavBar';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomNavBar();
    },
  );
}

/// generated route for
/// [_i3.DemoUi]
class DemoUi extends _i10.PageRouteInfo<void> {
  const DemoUi({List<_i10.PageRouteInfo>? children})
    : super(DemoUi.name, initialChildren: children);

  static const String name = 'DemoUi';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.DemoUi();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.NoInternetPage]
class NoInternetRoute extends _i10.PageRouteInfo<void> {
  const NoInternetRoute({List<_i10.PageRouteInfo>? children})
    : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.NoInternetPage();
    },
  );
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i7.QuestionsPage]
class QuestionsRoute extends _i10.PageRouteInfo<QuestionsRouteArgs> {
  QuestionsRoute({
    _i11.Key? key,
    required _i12.SubjectModel subject,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         QuestionsRoute.name,
         args: QuestionsRouteArgs(key: key, subject: subject),
         initialChildren: children,
       );

  static const String name = 'QuestionsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuestionsRouteArgs>();
      return _i7.QuestionsPage(key: args.key, subject: args.subject);
    },
  );
}

class QuestionsRouteArgs {
  const QuestionsRouteArgs({this.key, required this.subject});

  final _i11.Key? key;

  final _i12.SubjectModel subject;

  @override
  String toString() {
    return 'QuestionsRouteArgs{key: $key, subject: $subject}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuestionsRouteArgs) return false;
    return key == other.key && subject == other.subject;
  }

  @override
  int get hashCode => key.hashCode ^ subject.hashCode;
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsPage();
    },
  );
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashPage();
    },
  );
}
