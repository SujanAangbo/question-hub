import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/models/user_model.dart';

abstract interface class AuthRepository {
  Future<Result<UserModel>> loginWithEmail({
    required String email,
    required String password,
  });

  Future<Result<UserModel>> loginWithGoogle({
    required String idToken,
    required String name,
    required String email,
    String? image,
  });

  Future<Result<bool>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  });

  Future<bool> logout();

  Future<Result<bool>> forgotPassword({required String email});

  Future<Result<bool>> resetPassword({
    required String password,
    required String email,
  });

  Future<Result<UserModel>> verifyOtp({
    required String name,
    required String otp,
    required String email,
  });
}
