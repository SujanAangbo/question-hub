import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/common/validator.dart';
import 'package:question_hub/core/constants/app_assets.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/settings/presentation/providers/edit_profile_provider.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/primary_button.dart';
import 'package:question_hub/utils/ui/profile_image_renderer.dart';

import '../../../../utils/ui/sized_box.dart';

@RoutePage()
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  @override
  void initState() {
    final state = ref.read(userProvider)!;
    nameController = TextEditingController(text: state.name);
    emailController = TextEditingController(text: state.email);

    super.initState();
  }

  Future<void> editProfile() async {
    final updatedUser = await ref
        .read(editProfileProvider.notifier)
        .updateProfile();

    if (updatedUser != null) {
      ref.read(userProvider.notifier).setUser(updatedUser);
    }
  }

  Future<void> pickProfileImage() {
    return ref.read(editProfileProvider.notifier).pickProfileImage();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editProfileProvider);
    final userState = ref.watch(userProvider)!;
    final textTheme = Theme.of(context).textTheme;

    return FocusScaffold(
      appBar: DefaultAppBar(title: "Edit Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ProfileImageRenderer(
                    networkImage: userState.image,
                    assetImage: AppAssets.profileImage,
                    fileImage: state.profileImage,
                    radius: 80,
                  ),
                  8.heightBox,
                  PrimaryButton(
                    onTap: pickProfileImage,
                    text: "Change",
                    width: 120,
                    borderWidth: 1,
                    textColor: Theme.of(context).colorScheme.onSurface,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),

            16.heightBox,
            Text("Name", style: Theme.of(context).textTheme.titleMedium),
            4.heightBox,
            TextFormField(
              controller: nameController,
              onChanged: (value) {
                ref.read(editProfileProvider.notifier).updateName(value.trim());
              },
              validator: (value) {
                return AppValidator.validateTitle(value, 'name');
              },
              decoration: InputDecoration(hintText: 'Enter your name'),
            ),
            16.heightBox,
            Text("Email", style: Theme.of(context).textTheme.titleMedium),
            4.heightBox,
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                enabled: false,
              ),
            ),
            32.heightBox,
            PrimaryButton(
              onTap: editProfile,
              isDisabled: !state.isFormEdited,
              isLoading: state.isLoading,
              text: 'Edit Profile'.toUpperCase(),
            ),
            32.heightBox,
          ],
        ),
      ),
    );
  }
}
