import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/common/validator.dart';
import 'package:question_hub/features/auth/presentation/providers/email_signup_provider.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/primary_button.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../core/constants/app_assets.dart';
import '../widgets/auth_arrow_back_button.dart';

@RoutePage()
class EmailSignupPage extends ConsumerStatefulWidget {
  const EmailSignupPage({super.key});

  @override
  ConsumerState<EmailSignupPage> createState() => _EmailSignupPageState();
}

class _EmailSignupPageState extends ConsumerState<EmailSignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  signUp() {
    if (formKey.currentState!.validate()) {
      ref
          .read(emailSignUpProvider.notifier)
          .signUp(
            context: context,
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(emailSignUpProvider);

    return FocusScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthArrowBackButton(),

              Container(
                alignment: Alignment.center,
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
                      "Create an account",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
              32.heightBox,
              Text("Name", style: Theme.of(context).textTheme.titleMedium),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  return AppValidator.validateTitle(value, 'Name');
                },
                decoration: InputDecoration(hintText: 'Enter your name'),
              ),
              16.heightBox,
              Text(
                "Email Address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextFormField(
                controller: emailController,
                validator: AppValidator.validateEmail,
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                ),
              ),
              16.heightBox,

              Text("Password", style: Theme.of(context).textTheme.titleMedium),
              TextFormField(
                controller: passwordController,
                validator: AppValidator.validatePassword,
                decoration: InputDecoration(hintText: 'Enter your password'),
              ),
              16.heightBox,
              Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextFormField(
                controller: confirmPasswordController,
                validator: (value) {
                  return AppValidator.validateConfirmPassword(
                    value,
                    passwordController.text.trim(),
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Enter your confirm password',
                ),
              ),

              32.heightBox,
              PrimaryButton(
                onTap: signUp,
                isLoading: state.isLoading,
                text: 'Sign Up'.toUpperCase(),
              ),
              32.heightBox,
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Have an account already? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.router.pop();
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
