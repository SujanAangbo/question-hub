import 'dart:io';

import 'package:flutter/material.dart';
import 'package:question_hub/core/constants/app_assets.dart';

class ProfileImageRenderer extends StatelessWidget {
  const ProfileImageRenderer({
    super.key,
    this.networkImage,
    this.assetImage,
    this.fileImage,
    this.radius = 50,
  });

  final String? networkImage, assetImage;
  final File? fileImage;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (fileImage != null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: FileImage(fileImage!),
      );
    }

    if (networkImage != null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: NetworkImage(networkImage!),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade200,
      child: Image.asset(
        assetImage ?? AppAssets.profileImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
