import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return SharedPreferences.getInstance();
});

final appPreferencesProvider = Provider<AppPreferences>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value!;
  return AppPreferences(prefs);
});

class AppPreferences {
  final SharedPreferences _prefs;

  AppPreferences(this._prefs);

  final String _isFirstTime = 'is_first_time';
  final String _darkMode = 'dark_mode';

  bool get isFirstTime => _prefs.getBool(_isFirstTime) ?? true;

  Future<void> setFirstTimeFalse() => _prefs.setBool(_isFirstTime, false);

  bool get isDarkMode => _prefs.getBool(_darkMode) ?? false;

  Future<void> setDarkMode(bool value) => _prefs.setBool(_darkMode, value);
}
