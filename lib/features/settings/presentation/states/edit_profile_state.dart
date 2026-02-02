import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(false) bool isFormEdited,
    @Default(false) bool isLoading,
    File? profileImage,
  }) = _EditProfileState;
}
