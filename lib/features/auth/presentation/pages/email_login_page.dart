import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/app/routes/app_router.dart';
import 'package:question_hub/core/common/validator.dart';
import 'package:question_hub/core/shared_preferences/app_preferences.dart';
import 'package:question_hub/features/auth/presentation/providers/email_login_provider.dart';
import 'package:question_hub/features/auth/presentation/providers/user_provider.dart';
import 'package:question_hub/features/auth/presentation/widgets/auth_arrow_back_button.dart';
import 'package:question_hub/models/user_model.dart';
import 'package:question_hub/utils/ui/app_horizontal_divider.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/primary_button.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../core/constants/app_assets.dart';

@RoutePage()
class EmailLoginPage extends ConsumerStatefulWidget {
  const EmailLoginPage({super.key, required this.isPopAble});

  final bool isPopAble;

  @override
  ConsumerState<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends ConsumerState<EmailLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final response = await ref
          .read(emailLoginProvider.notifier)
          .login(context: context, email: email, password: password);

      if (response == null) return;

      _saveUserAndNavigateToHomePage(response);
    }
  }

  loginWithGoogle() async {
    final response = await ref
        .read(emailLoginProvider.notifier)
        .loginWithGoogle();

    if (response == null) return;

    _saveUserAndNavigateToHomePage(response);
  }

  _saveUserAndNavigateToHomePage(UserModel user) {
    ref.read(userProvider.notifier).setUser(user);
    ref.read(appPreferencesProvider).setUser(user);

    if (widget.isPopAble) {
      AppRouterHelper.pop(true);
      return;
    } else {
      context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailLoginProvider);

    return FocusScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthArrowBackButton(),

            Container(
              alignment: Alignment.center,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      width: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.foregroundLogo),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      "Question Hub",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    16.widthBox,
                    Text(
                      "Login to continue",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            32.heightBox,
            Text(
              "Email Address",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextFormField(
              controller: emailController,
              validator: AppValidator.validateEmail,
              decoration: InputDecoration(hintText: 'Enter your email address'),
            ),
            16.heightBox,

            Text("Password", style: Theme.of(context).textTheme.titleMedium),
            TextFormField(
              controller: passwordController,
              validator: AppValidator.validatePassword,
              decoration: InputDecoration(hintText: 'Enter your password'),
            ),
            16.heightBox,
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  context.router.push(ForgotPasswordRoute());
                },
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),

            32.heightBox,
            PrimaryButton(
              onTap: login,
              isLoading: state.isLoading,
              text: 'Log in'.toUpperCase(),
            ),
            32.heightBox,
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.push(EmailSignupRoute());
                        },
                    ),
                  ],
                ),
              ),
            ),

            32.heightBox,
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: AppHorizontalDivider()),
                8.widthBox,
                Text("OR", style: Theme.of(context).textTheme.titleMedium),
                8.widthBox,
                Expanded(child: AppHorizontalDivider()),
              ],
            ),
            32.heightBox,
            PrimaryButton(
              onTap: loginWithGoogle,
              color: Colors.red,
              isLoading: state.isGoogleLoading,
              borderColor: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.googleIcon,
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  16.widthBox,
                  Text(
                    "Sign In with Google".toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
