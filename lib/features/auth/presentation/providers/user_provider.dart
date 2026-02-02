import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/core/shared_preferences/app_preferences.dart';
import 'package:question_hub/models/user_model.dart';

final userProvider = StateNotifierProvider<UserProvider, UserModel?>(
  (ref) =>
      UserProvider(null, appPreferences: ref.watch(appPreferencesProvider)),
);

class UserProvider extends StateNotifier<UserModel?> {
  final AppPreferences _appPreferences;

  UserProvider(super.state, {required AppPreferences appPreferences})
    : _appPreferences = appPreferences;

  void setUser(UserModel? user) {
    // updating local storage when data changes
    if (user == null) {
      _appPreferences.resetUserData();
    } else {
      _appPreferences.setUser(user);
    }

    // updating state
    state = user;
  }

  UserModel? get getUser {
    return state;
  }
}
