import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_horizontal_divider.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleWidget,
    this.action,
    this.centerTitle = true,
    this.hasBottomDivider = false,
    this.bottom,
    this.toolbarHeight,
  });

  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final Widget? action;
  final bool centerTitle;
  final bool hasBottomDivider;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      Size(double.infinity, toolbarHeight ?? kToolbarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  Widget? buildTitle() {
    if (widget.title != null) {
      return Text(widget.title!);
    } else {
      return widget.titleWidget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      elevation: 1,
      title: buildTitle(),
      toolbarHeight: widget.toolbarHeight,
      leading:
          widget.leading ??
          (context.router.canPop()
              ? AppIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    context.router.maybePop();
                  },
                )
              : null),
      centerTitle: widget.centerTitle,
      actions: widget.action == null ? [] : [widget.action!],
      bottom:
          widget.bottom ??
          (widget.hasBottomDivider
              ? PreferredSize(
                  preferredSize: Size(double.infinity, 1),
                  child: AppHorizontalDivider(),
                )
              : null),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size,
    this.color,
    this.background,
  });

  final IconData icon;
  final Color? color;
  final double? size;
  final VoidCallback onPressed;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(color: background),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}
