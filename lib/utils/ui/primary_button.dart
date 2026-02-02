import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_hub/theme/color_palette.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? blurRadius;
  final Widget? child;
  final String? text;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool isDisabled;
  final Color? textColor;

  const PrimaryButton({
    this.text,
    required this.onTap,
    this.borderColor,
    this.color,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.blurRadius,
    this.borderWidth,
    this.radius,
    this.borderRadius,
    this.textStyle,
    this.isLoading = false,
    this.isDisabled = false,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorPalette.grey.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(radius ?? 10),
      onTap: () {
        if (isLoading || isDisabled) {
          return;
        }

        onTap.call();
      },
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth ?? 0,
            color:
                borderColor ??
                (isDisabled
                    ? ColorPalette.primary.withValues(alpha: 0.5)
                    : ColorPalette.primary),
          ),
          color:
              color ??
              (isDisabled
                  ? ColorPalette.primary.withValues(alpha: 0.5)
                  : ColorPalette.primary),
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
        ),
        height: height,
        width: width,
        child: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(color: ColorPalette.white),
              )
            : Center(
                child:
                    child ??
                    Text(
                      text ?? '',
                      style:
                          textStyle ??
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: textColor ?? CupertinoColors.white,
                          ),
                    ),
              ),
      ),
    );
  }
}
