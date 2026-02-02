import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/features/auth/data/repository/auth_repository_impl.dart';
import 'package:question_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

import '../states/email_signup_state.dart';

final emailSignUpProvider =
    StateNotifierProvider<EmailSignupProvider, EmailSignupState>((ref) {
      return EmailSignupProvider(
        EmailSignupState(),
        authRepository: ref.read(authRepositoryProvider),
      );
    });

class EmailSignupProvider extends StateNotifier<EmailSignupState> {
  final AuthRepository _authRepository;

  EmailSignupProvider(super.state, {required AuthRepository authRepository})
    : _authRepository = authRepository;

  signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _authRepository.signUpWithEmail(
      name: name,
      email: email,
      password: password,
    );

    state = state.copyWith(isLoading: false);

    if (response.isSuccess) {
      context.router.push(OtpRoute(email: email, name: name));
    } else {
      print(response.error ?? "");
      ToastService.e(response.error ?? "");
    }
  }
}
