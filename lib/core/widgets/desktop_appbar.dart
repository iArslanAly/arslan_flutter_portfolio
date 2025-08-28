import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double height;

  const DesktopAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.height = kToolbarHeight, // default height (56.0)
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      backgroundColor:
          backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      centerTitle: false,
    );
  }
}
