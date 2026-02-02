import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:question_hub/core/common/image_picker_utils.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/settings/data/repository/setting_repository.dart';
import 'package:question_hub/features/settings/data/repository/setting_repository_impl.dart';
import 'package:question_hub/features/settings/presentation/states/edit_profile_state.dart';
import 'package:question_hub/models/user_model.dart';
import 'package:question_hub/utils/ui/toast_service.dart';

final editProfileProvider =
    StateNotifierProvider.autoDispose<EditProfileProvider, EditProfileState>((
      ref,
    ) {
      return EditProfileProvider(
        EditProfileState(),
        currentUser: ref.watch(userProvider)!, // we have already checked
        settingRepository: ref.watch(settingRepositoryProvider),
      );
    });

class EditProfileProvider extends StateNotifier<EditProfileState> {
  final UserModel currentUser;
  late UserModel updatedUser; // for storing user update(name)

  final SettingRepository _settingRepository;

  EditProfileProvider(
    super.state, {
    required this.currentUser,
    required SettingRepository settingRepository,
  }) : _settingRepository = settingRepository {
    updatedUser = currentUser;
  }

  void updateName(String name) {
    updatedUser = updatedUser.copyWith(name: name);
    _checkFormEdited();
  }

  Future<void> pickProfileImage() async {
    final pickedImage = await ImagePickerUtil.pickImage(
      ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImage == null) return;

    final imageSize = await pickedImage.length();

    if (imageSize > 1024 * 1024 * 2) {
      ToastService.e("Select image less than 2 MB");
      return;
    }

    setImage(pickedImage);
    _checkFormEdited();
  }

  void setImage(File? image) {
    state = state.copyWith(profileImage: image);
  }

  Future<UserModel?> updateProfile() async {
    state = state.copyWith(isLoading: true);

    // edit logic
    final response = await _settingRepository.updateUserProfile(
      userId: currentUser.id,
      name: updatedUser.name,
      image: state.profileImage,
    );

    state = state.copyWith(isLoading: false);

    if (response.isSuccess) {
      return response.data;
    } else {
      ToastService.e(response.error ?? 'Unable to update profile');
      return null;
    }
  }

  void _checkFormEdited() {
    bool isFormEdited = false;

    if (updatedUser.name != currentUser.name || state.profileImage != null) {
      isFormEdited = true;
    }

    state = state.copyWith(isFormEdited: isFormEdited);
  }
}
