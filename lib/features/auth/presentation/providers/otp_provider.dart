import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/features/auth/data/repository/auth_repository_impl.dart';
import 'package:question_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:question_hub/features/auth/presentation/states/otp_state.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

final otpProvider = StateNotifierProvider<OtpProvider, OtpState>((ref) {
  return OtpProvider(
    OtpState(),
    authRepository: ref.read(authRepositoryProvider),
  );
});

class OtpProvider extends StateNotifier<OtpState> {
  final AuthRepository _authRepository;

  OtpProvider(super.state, {required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<void> verifyOtp({
    required BuildContext context,
    required String name,
    required String otp,
    required String email,
  }) async {
    state = state.copyWith(isLoading: true);

    final response = await _authRepository.verifyOtp(
      name: name,
      otp: otp,
      email: email,
    );

    state = state.copyWith(isLoading: false);

    if (response.isSuccess) {
      ToastService.s("User created successfully! Login to continue");
      context.router.popUntil(
        (route) => route.settings.name == EmailLoginRoute.name,
      );
    } else {
      print(response.error ?? "");
      ToastService.e(response.error ?? "");
    }
  }
}
