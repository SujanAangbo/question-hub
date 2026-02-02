import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:question_hub/app/routes/app_route.gr.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/primary_button.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../widgets/auth_arrow_back_button.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  forgotPassword() {
    context.router.push(OtpRoute(email: "abcd@gmail", name: ""));
  }

  @override
  Widget build(BuildContext context) {
    return FocusScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AuthArrowBackButton(),
                8.widthBox,
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),

            8.heightBox,
            Text(
              'Enter your email address and we will share a link to create a new password.',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            16.heightBox,
            TextField(
              decoration: InputDecoration(hintText: 'Enter your email address'),
            ),
            32.heightBox,
            PrimaryButton(
              onTap: forgotPassword,
              text: 'Forgot Password'.toUpperCase(),
            ),
            32.heightBox,
          ],
        ),
      ),
    );
  }
}
