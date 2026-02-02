import 'package:flutter/material.dart';
import 'package:question_hub/theme/color_palette.dart';

class AppHorizontalDivider extends StatelessWidget {
  const AppHorizontalDivider({
    this.height = 0,
    this.thickness = 1,
    this.color,
    super.key,
  });

  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color ?? ColorPalette.grey,
      thickness: thickness,
    );
  }
}
