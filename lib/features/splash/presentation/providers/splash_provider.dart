import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/provider/network_provider.dart';
import 'package:question_hub/core/shared_preferences/app_preferences.dart';

import '../../../../core/enums/network_status.dart';

enum SplashDestination { noInternet, onboarding, bookmark, home }

final splashProvider = AsyncNotifierProvider(() => SplashProvider());

/// returns the SplashDestination based on the conditions
class SplashProvider extends AsyncNotifier<SplashDestination> {
  @override
  Future<SplashDestination> build() async {
    final appPreference = ref.watch(appPreferencesProvider);
    final networkStatus = ref.watch(networkProvider);

    return await Future.delayed(Duration(seconds: 4), () {
      if (appPreference.isFirstTime) {
        if (networkStatus.value == NetworkStatus.disconnected) {
          return SplashDestination.noInternet;
        } else {
          return SplashDestination.onboarding;
        }
      } else {
        if (networkStatus.value == NetworkStatus.disconnected) {
          return SplashDestination.bookmark;
        } else {
          return SplashDestination.home;
        }
      }
    });
  }
}
