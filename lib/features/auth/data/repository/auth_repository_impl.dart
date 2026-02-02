import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:question_hub/models/user_model.dart';
import 'package:question_hub/services/remote/auth_service.dart';
import 'package:question_hub/services/remote/user_service.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(
    authService: ref.read(authServiceProvider),
    userService: ref.read(userServiceProvider),
  ),
);

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final UserService _userService;

  AuthRepositoryImpl({
    required AuthService authService,
    required UserService userService,
  }) : _authService = authService,
       _userService = userService;

  @override
  Future<Result<UserModel>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await _authService.loginWithEmail(
        email: email,
        password: password,
      );

      if (userId == null) {
        return Result.error("Unable to login");
      }

      final userData = await _userService.getUserById(userId);

      if (userData == null) {
        return Result.error("User not found");
      }

      final user = UserModel.fromJson(userData);
      return Result.success(user);
    } catch (e) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<UserModel>> loginWithGoogle({
    required String idToken,
    required String name,
    required String email,
    String? image,
  }) async {
    try {
      final userId = await _authService.signInWithGoogle(idToken: idToken);

      if (userId == null) {
        return Result.error('Unable to login with google');
      }

      final userData = await _userService.getUserById(userId);

      // if user is not present in the db
      if (userData == null) {
        final response = await _userService.createUser(
          userId: userId,
          email: email,
          name: name,
          image: image,
        );

        return Result.success(UserModel.fromJson(response));
      }

      return Result.success(UserModel.fromJson(userData));
    } catch (e) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _authService.signUpWithEmail(email: email, password: password);

      return Result.success(true);
    } catch (e) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<bool>> forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> resetPassword({
    required String password,
    required String email,
  }) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> verifyOtp({
    required String name,
    required String otp,
    required String email,
  }) async {
    try {
      final userId = await _authService.verifyOtp(email: email, otp: otp);

      if (userId == null) {
        return Result.error("Unable to create user");
      }

      final userData = await _userService.createUser(
        name: name,
        email: email,
        userId: userId,
      );

      final user = UserModel.fromJson(userData);
      return Result.success(user);
    } catch (e) {
      log(e.toString());
      return Result.error(e.toString());
    }
  }
}
