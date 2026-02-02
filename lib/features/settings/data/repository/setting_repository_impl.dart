import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/features/settings/data/repository/setting_repository.dart';
import 'package:question_hub/models/user_model.dart';
import 'package:question_hub/services/remote/storage_service.dart';
import 'package:question_hub/services/remote/user_service.dart';

final settingRepositoryProvider = Provider(
  (ref) => SettingRepositoryImpl(
    userService: ref.watch(userServiceProvider),
    storageService: ref.watch(storageServiceProvider),
  ),
);

class SettingRepositoryImpl implements SettingRepository {
  SettingRepositoryImpl({
    required UserService userService,
    required StorageService storageService,
  }) : _userService = userService,
       _storageService = storageService;

  final UserService _userService;
  final StorageService _storageService;

  @override
  Future<Result<UserModel>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Result<UserModel>> updateUserProfile({
    required String userId,
    required String name,
    File? image,
  }) async {
    try {
      String? imageUrl;
      if (image != null) {
        imageUrl = await _storageService.insertImage(
          image,
          SupabaseConstants.usersTable,
        );
      }
      final response = await _userService.updateUser(
        userId: userId,
        name: name,
        image: imageUrl,
      );

      return Result.success(UserModel.fromJson(response));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Result.error(e.toString());
    }
  }
}
