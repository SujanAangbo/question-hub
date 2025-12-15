import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusScaffold(body: Center(child: Text("Settings Page")));
  }
}
