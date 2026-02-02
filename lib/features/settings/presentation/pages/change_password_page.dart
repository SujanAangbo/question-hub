import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusScaffold(body: Center(child: Text("Change Password page")));
  }
}
