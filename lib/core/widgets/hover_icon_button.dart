import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HoverIconButton extends StatefulWidget {
  final String assetPath;
  final double size;
  final VoidCallback? onTap;

  const HoverIconButton({
    required this.assetPath,
    required this.size,
    this.onTap,
    super.key,
  });

  @override
  _HoverIconButtonState createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  bool _isHovered = false;

  static const Color tabHoverText = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(
            widget.size * 0.25,
          ), // padding inside round bg
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.onSurface : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.onSurface,
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.d34),
            child: SvgPicture.asset(
              widget.assetPath,
              width: widget.size,
              color: _isHovered ? tabHoverText : AppColors.onBackground,
            ),
          ),
        ),
      ),
    );
  }

  void _setHovered(bool hovered) {
    setState(() {
      _isHovered = hovered;
    });
  }
}
