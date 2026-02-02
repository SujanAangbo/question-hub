import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_login_state.freezed.dart';

@freezed
abstract class EmailLoginState with _$EmailLoginState {
  const factory EmailLoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isGoogleLoading,
  }) = _EmailLoginState;
}
