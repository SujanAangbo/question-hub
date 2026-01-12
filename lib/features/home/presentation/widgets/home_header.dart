import 'package:flutter/material.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../theme/color_palette.dart';

class QuestionHubHeader extends StatelessWidget {
  const QuestionHubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Adaptive Colors based on your palette
    final bgColor = Theme.of(context).primaryColor;
    final titleColor = isDark ? ColorPalette.onSurfaceDark : Colors.white;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Branding Row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorPalette.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.school_rounded,
                      color: titleColor,
                      size: 28,
                    ),
                  ),
                  16.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Question Hub",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(color: titleColor),
                      ),
                      4.heightBox,
                      Text(
                        "Previous Year Questions",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ColorPalette.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              24.heightBox,

              // Enhanced Search Bar
              Container(
                height: 55,
                decoration: BoxDecoration(
                  // color: searchBg,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  cursorColor: Theme.of(context).colorScheme.onSurface,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    hintText: "Search Subject...",

                    prefixIcon: Icon(
                      Icons.search,
                      color: isDark
                          ? ColorPalette.outlineDark
                          : ColorPalette.primary,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
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
