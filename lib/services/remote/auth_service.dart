import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authServiceProvider = Provider((ref) => AuthService());

class AuthService {
  /// login with email and password and return id of the user.
  /// if id is null then auth failed.
  Future<String?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response.user?.id;
  }

  /// login with email and password and return id of the user.
  /// if id is null then auth failed.
  Future<String?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
    );

    return response.user?.id;
  }

  /// login with email and password and return id of the user.
  /// if id is null then auth failed.
  Future<String?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await supabaseClient.auth.verifyOTP(
      email: email,
      token: otp,
      type: OtpType.email,
    );

    return response.user?.id;
  }

  Future<String?> signInWithGoogle({
    required String idToken,
    // required String accessToken,
  }) async {
    final response = await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
    );

    return response.user?.id;
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await supabaseClient.auth.updateUser(UserAttributes(password: newPassword));
  }
}
