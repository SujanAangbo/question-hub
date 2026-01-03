import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/shared_preferences/app_preferences.dart';

final themeProvider = AsyncNotifierProvider(() => ThemeProvider());

class ThemeProvider extends AsyncNotifier<bool> {
  late final AppPreferences _appPreferences;

  @override
  FutureOr<bool> build() {
    _appPreferences = ref.watch(appPreferencesProvider);
    return _appPreferences.isDarkMode;
  }

  bool get isDarkMode => state.value!;

  set updateTheme(bool isDarkMode) {
    state = AsyncData(isDarkMode);
    _appPreferences.setDarkMode(isDarkMode);
  }
}
