import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/app/routes/app_router.dart';
import 'package:question_hub/core/constants/app_assets.dart';
import 'package:question_hub/core/shared_preferences/app_preferences.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/settings/presentation/providers/theme_provider.dart';
import 'package:question_hub/features/settings/presentation/widgets/course_picker_sheet.dart';
import 'package:question_hub/models/user_model.dart';
import 'package:question_hub/utils/ui/app_horizontal_divider.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/profile_image_renderer.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);

    return FocusScaffold(
      appBar: DefaultAppBar(title: "Settings"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // if is authenticated
              if (userState != null) ...[
                profileSection(userState),
                16.heightBox,
                myAccountSection(),
              ],

              appPreferencesSetting(),
              aboutSection(),
              8.heightBox,
              logoutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Card profileSection(UserModel userState) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ProfileImageRenderer(
              networkImage: userState.image,
              assetImage: AppAssets.profileImage,
            ),
            8.heightBox,
            Text(
              userState.name,
              style: textTheme.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            // 4.heightBox,
            Text(userState.email, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }

  Widget appPreferencesSetting() {
    final provider = ref.watch(themeProvider);

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "App Preferences",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          8.heightBox,
          AppHorizontalDivider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('My Course'),
            subtitle: const Text('Bachelor of Computer Application'),
            trailing: const Icon(Icons.arrow_drop_down),
            onTap: () async {
              await showModalBottomSheet<String>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => CoursePickerSheet(),
              );
            },
          ),
          AppHorizontalDivider(),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            value: provider.value ?? false,
            onChanged: (value) {
              ref.read(themeProvider.notifier).updateTheme = value;
            },
          ),
        ],
      ),
    );
  }

  Widget myAccountSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "My Account",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          8.heightBox,
          AppHorizontalDivider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Edit Profile'),
            onTap: () {
              AppRouterHelper.push(EditProfileRoute());
            },
          ),
          if (supabaseClient.auth.currentUser!.identities!.any(
            (i) => i.provider == 'email',
          )) ...[
            AppHorizontalDivider(),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Change Password'),
              onTap: () {
                AppRouterHelper.push(ChangePasswordRoute());
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget aboutSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Others",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          8.heightBox,
          AppHorizontalDivider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('About Us'),
            onTap: () {},
          ),
          AppHorizontalDivider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),
          AppHorizontalDivider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Terms and Conditions'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget logoutSection() {
    final userState = ref.watch(userProvider);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(
          Icons.logout,
          color: userState == null ? null : Colors.red,
        ),
        title: Text(
          userState == null ? "Login" : "Logout",
          style: TextStyle(color: userState == null ? null : Colors.red),
        ),
        onTap: () async {
          if (userState != null) {
            // clear user data from userProvider
            await ref.read(appPreferencesProvider).resetUserData();
            ref.invalidate(userProvider);
            // logout supabase
            await supabaseClient.auth.signOut();
            // navigate to login page
            AppRouterHelper.replaceAll([EmailLoginRoute(isPopAble: false)]);
            return;
          }

          AppRouterHelper.push(EmailLoginRoute(isPopAble: false));
        },
      ),
    );
  }
}
