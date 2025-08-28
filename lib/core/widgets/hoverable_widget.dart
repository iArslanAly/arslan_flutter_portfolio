import 'package:flutter/material.dart';

class HoverableWidget extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final VoidCallback? onTap;

  const HoverableWidget({super.key, required this.builder, this.onTap});

  @override
  State<HoverableWidget> createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.builder(isHovered),
      ),
    );
  }
}
