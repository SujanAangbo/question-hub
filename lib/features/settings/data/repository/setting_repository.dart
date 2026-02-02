import 'dart:io';

import 'package:question_hub/core/response/result.dart';
import 'package:question_hub/models/user_model.dart';

abstract class SettingRepository {
  Future<Result<UserModel>> updateUserProfile({
    required String userId,
    required String name,
    File? image,
  });

  Future<Result<UserModel>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
