import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/models/user_model.dart';
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
  final String _userData = 'user';

  bool get isFirstTime => _prefs.getBool(_isFirstTime) ?? true;

  Future<void> setFirstTimeFalse() => _prefs.setBool(_isFirstTime, false);

  bool get isDarkMode => _prefs.getBool(_darkMode) ?? false;

  Future<void> setDarkMode(bool value) => _prefs.setBool(_darkMode, value);

  Future<void> clear() => _prefs.clear();

  Future<bool> setUser(UserModel user) async {
    return await _prefs.setString(_userData, jsonEncode(user.toJson()));
  }

  UserModel? getUser() {
    final user = _prefs.getString(_userData);
    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }

  Future<void> resetUserData() async {
    await _prefs.remove(_userData);
  }
}
