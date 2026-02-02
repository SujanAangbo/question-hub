// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:question_hub/features/auth/presentation/pages/email_login_page.dart'
    as _i6;
import 'package:question_hub/features/auth/presentation/pages/email_signup_page.dart'
    as _i7;
import 'package:question_hub/features/auth/presentation/pages/forgot_password_page.dart'
    as _i8;
import 'package:question_hub/features/auth/presentation/pages/otp_page.dart'
    as _i12;
import 'package:question_hub/features/auth/presentation/pages/reset_password_page.dart'
    as _i15;
import 'package:question_hub/features/auth/presentation/pages/splash_page.dart'
    as _i18;
import 'package:question_hub/features/bookmark/presentation/pages/bookmark_page.dart'
    as _i1;
import 'package:question_hub/features/bottom_nav_bar/presentation/pages/bottom_nav_bar.dart'
    as _i2;
import 'package:question_hub/features/demo/demo_ui.dart' as _i4;
import 'package:question_hub/features/home/presentation/pages/home_page.dart'
    as _i9;
import 'package:question_hub/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i11;
import 'package:question_hub/features/questions/presentation/pages/question_detail_page.dart'
    as _i13;
import 'package:question_hub/features/questions/presentation/pages/questions_page.dart'
    as _i14;
import 'package:question_hub/features/search/presentation/pages/search_page.dart'
    as _i16;
import 'package:question_hub/features/settings/presentation/pages/change_password_page.dart'
    as _i3;
import 'package:question_hub/features/settings/presentation/pages/edit_profile_page.dart'
    as _i5;
import 'package:question_hub/features/settings/presentation/pages/no_internet_page.dart'
    as _i10;
import 'package:question_hub/features/settings/presentation/pages/settings_page.dart'
    as _i17;
import 'package:question_hub/models/pyq_model.dart' as _i22;
import 'package:question_hub/models/subject_model.dart' as _i23;

/// generated route for
/// [_i1.BookmarkPage]
class BookmarkRoute extends _i19.PageRouteInfo<void> {
  const BookmarkRoute({List<_i19.PageRouteInfo>? children})
    : super(BookmarkRoute.name, initialChildren: children);

  static const String name = 'BookmarkRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.BookmarkPage();
    },
  );
}

/// generated route for
/// [_i2.BottomNavBar]
class BottomNavBar extends _i19.PageRouteInfo<void> {
  const BottomNavBar({List<_i19.PageRouteInfo>? children})
    : super(BottomNavBar.name, initialChildren: children);

  static const String name = 'BottomNavBar';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomNavBar();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordPage]
class ChangePasswordRoute extends _i19.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i4.DemoUi]
class DemoUi extends _i19.PageRouteInfo<void> {
  const DemoUi({List<_i19.PageRouteInfo>? children})
    : super(DemoUi.name, initialChildren: children);

  static const String name = 'DemoUi';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i4.DemoUi();
    },
  );
}

/// generated route for
/// [_i5.EditProfilePage]
class EditProfileRoute extends _i19.PageRouteInfo<void> {
  const EditProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.EditProfilePage();
    },
  );
}

/// generated route for
/// [_i6.EmailLoginPage]
class EmailLoginRoute extends _i19.PageRouteInfo<EmailLoginRouteArgs> {
  EmailLoginRoute({
    _i20.Key? key,
    required bool isPopAble,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         EmailLoginRoute.name,
         args: EmailLoginRouteArgs(key: key, isPopAble: isPopAble),
         initialChildren: children,
       );

  static const String name = 'EmailLoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EmailLoginRouteArgs>();
      return _i6.EmailLoginPage(key: args.key, isPopAble: args.isPopAble);
    },
  );
}

class EmailLoginRouteArgs {
  const EmailLoginRouteArgs({this.key, required this.isPopAble});

  final _i20.Key? key;

  final bool isPopAble;

  @override
  String toString() {
    return 'EmailLoginRouteArgs{key: $key, isPopAble: $isPopAble}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EmailLoginRouteArgs) return false;
    return key == other.key && isPopAble == other.isPopAble;
  }

  @override
  int get hashCode => key.hashCode ^ isPopAble.hashCode;
}

/// generated route for
/// [_i7.EmailSignupPage]
class EmailSignupRoute extends _i19.PageRouteInfo<void> {
  const EmailSignupRoute({List<_i19.PageRouteInfo>? children})
    : super(EmailSignupRoute.name, initialChildren: children);

  static const String name = 'EmailSignupRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i7.EmailSignupPage();
    },
  );
}

/// generated route for
/// [_i8.ForgotPasswordPage]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomePage();
    },
  );
}

/// generated route for
/// [_i10.NoInternetPage]
class NoInternetRoute extends _i19.PageRouteInfo<void> {
  const NoInternetRoute({List<_i19.PageRouteInfo>? children})
    : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.NoInternetPage();
    },
  );
}

/// generated route for
/// [_i11.OnboardingPage]
class OnboardingRoute extends _i19.PageRouteInfo<void> {
  const OnboardingRoute({List<_i19.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i12.OtpPage]
class OtpRoute extends _i19.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i21.Key? key,
    required String email,
    required String name,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, email: email, name: name),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i12.OtpPage(key: args.key, email: args.email, name: args.name);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.email, required this.name});

  final _i21.Key? key;

  final String email;

  final String name;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, email: $email, name: $name}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key && email == other.email && name == other.name;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ name.hashCode;
}

/// generated route for
/// [_i13.QuestionDetailPage]
class QuestionDetailRoute extends _i19.PageRouteInfo<QuestionDetailRouteArgs> {
  QuestionDetailRoute({
    _i20.Key? key,
    required _i22.PyqModel question,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         QuestionDetailRoute.name,
         args: QuestionDetailRouteArgs(key: key, question: question),
         initialChildren: children,
       );

  static const String name = 'QuestionDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuestionDetailRouteArgs>();
      return _i13.QuestionDetailPage(key: args.key, question: args.question);
    },
  );
}

class QuestionDetailRouteArgs {
  const QuestionDetailRouteArgs({this.key, required this.question});

  final _i20.Key? key;

  final _i22.PyqModel question;

  @override
  String toString() {
    return 'QuestionDetailRouteArgs{key: $key, question: $question}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuestionDetailRouteArgs) return false;
    return key == other.key && question == other.question;
  }

  @override
  int get hashCode => key.hashCode ^ question.hashCode;
}

/// generated route for
/// [_i14.QuestionsPage]
class QuestionsRoute extends _i19.PageRouteInfo<QuestionsRouteArgs> {
  QuestionsRoute({
    _i21.Key? key,
    required _i23.SubjectModel subject,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         QuestionsRoute.name,
         args: QuestionsRouteArgs(key: key, subject: subject),
         initialChildren: children,
       );

  static const String name = 'QuestionsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuestionsRouteArgs>();
      return _i14.QuestionsPage(key: args.key, subject: args.subject);
    },
  );
}

class QuestionsRouteArgs {
  const QuestionsRouteArgs({this.key, required this.subject});

  final _i21.Key? key;

  final _i23.SubjectModel subject;

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
/// [_i15.ResetPasswordPage]
class ResetPasswordRoute extends _i19.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i15.ResetPasswordPage();
    },
  );
}

/// generated route for
/// [_i16.SearchPage]
class SearchRoute extends _i19.PageRouteInfo<void> {
  const SearchRoute({List<_i19.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.SearchPage();
    },
  );
}

/// generated route for
/// [_i17.SettingsPage]
class SettingsRoute extends _i19.PageRouteInfo<void> {
  const SettingsRoute({List<_i19.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.SettingsPage();
    },
  );
}

/// generated route for
/// [_i18.SplashPage]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.SplashPage();
    },
  );
}
