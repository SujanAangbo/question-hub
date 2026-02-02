import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:question_hub/features/auth/presentation/states/email_login_state.dart';
import 'package:question_hub/models/user_model.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

import '../../data/repository/auth_repository_impl.dart';

final emailLoginProvider =
    StateNotifierProvider<EmailLoginProvider, EmailLoginState>((ref) {
      return EmailLoginProvider(
        EmailLoginState(),
        authRepository: ref.read(authRepositoryProvider),
      );
    });

class EmailLoginProvider extends StateNotifier<EmailLoginState> {
  final AuthRepository _authRepository;

  EmailLoginProvider(super.state, {required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<UserModel?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _authRepository.loginWithEmail(
      email: email,
      password: password,
    );

    state = state.copyWith(isLoading: false);

    if (response.isSuccess && response.data != null) {
      return response.data;
    } else {
      ToastService.e(response.error ?? "");
      return null;
    }
  }

  Future<UserModel?> loginWithGoogle() async {
    state = state.copyWith(isGoogleLoading: true);

    log(SupabaseConstants.iosClientId);
    log(SupabaseConstants.webClientId);
    final googleSignIn = GoogleSignIn.instance;

    googleSignIn.initialize(
      clientId: SupabaseConstants.iosClientId,
      serverClientId: SupabaseConstants.webClientId,
    );

    try {
      final account = await googleSignIn.authenticate();

      final auth = account.authentication;
      final idToken = auth.idToken;

      if (idToken == null) {
        state = state.copyWith(isGoogleLoading: false);
        return null;
      }
      final response = await _authRepository.loginWithGoogle(
        idToken: idToken,
        email: account.email,
        name: account.displayName ?? '',
        image: account.photoUrl,
      );

      if (response.isSuccess && response.data != null) {
        final userData = response.data;
        return userData;
      } else {
        ToastService.e(response.error ?? "");
        return null;
      }
    } catch (e) {
      log(e.toString());
      ToastService.e(e.toString());
      return null;
    } finally {
      state = state.copyWith(isGoogleLoading: false);
    }
  }
}
