import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthArrowBackButton extends StatelessWidget {
  const AuthArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.router.canPop()) {
      return IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      );
    }
    return SizedBox.shrink();
  }
}
