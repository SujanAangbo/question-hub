import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_signup_state.freezed.dart';

@freezed
abstract class EmailSignupState with _$EmailSignupState {
  factory EmailSignupState({
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @Default(false) bool isLoading,
  }) = _EmailSignupState;
}
