import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';
import 'package:question_hub/utils/ui/primary_button.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../widgets/auth_arrow_back_button.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
                Center(
                  child: Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            32.heightBox,
            Text(
              "New Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter your password'),
            ),
            16.heightBox,

            Text(
              "Confirm Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter your password'),
            ),

            32.heightBox,
            PrimaryButton(onTap: () {}, text: 'Log in'.toUpperCase()),
          ],
        ),
      ),
    );
  }
}
