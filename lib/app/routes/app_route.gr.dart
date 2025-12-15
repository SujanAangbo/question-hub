// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:question_hub/features/bookmark/presentation/pages/bookmark_page.dart'
    as _i1;
import 'package:question_hub/features/bottom_nav_bar/presentation/pages/bottom_nav_bar.dart'
    as _i2;
import 'package:question_hub/features/home/data/models/subject_model.dart'
    as _i8;
import 'package:question_hub/features/home/presentation/pages/home_page.dart'
    as _i3;
import 'package:question_hub/features/questions/presentation/pages/questions_page.dart'
    as _i4;
import 'package:question_hub/features/settings/presentation/pages/settings_page.dart'
    as _i5;

/// generated route for
/// [_i1.BookmarkPage]
class BookmarkRoute extends _i6.PageRouteInfo<void> {
  const BookmarkRoute({List<_i6.PageRouteInfo>? children})
    : super(BookmarkRoute.name, initialChildren: children);

  static const String name = 'BookmarkRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.BookmarkPage();
    },
  );
}

/// generated route for
/// [_i2.BottomNavBar]
class BottomNavBar extends _i6.PageRouteInfo<void> {
  const BottomNavBar({List<_i6.PageRouteInfo>? children})
    : super(BottomNavBar.name, initialChildren: children);

  static const String name = 'BottomNavBar';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomNavBar();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.QuestionsPage]
class QuestionsRoute extends _i6.PageRouteInfo<QuestionsRouteArgs> {
  QuestionsRoute({
    _i7.Key? key,
    required _i8.SubjectModel subject,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         QuestionsRoute.name,
         args: QuestionsRouteArgs(key: key, subject: subject),
         initialChildren: children,
       );

  static const String name = 'QuestionsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuestionsRouteArgs>();
      return _i4.QuestionsPage(key: args.key, subject: args.subject);
    },
  );
}

class QuestionsRouteArgs {
  const QuestionsRouteArgs({this.key, required this.subject});

  final _i7.Key? key;

  final _i8.SubjectModel subject;

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
/// [_i5.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsPage();
    },
  );
}
