import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  State<HoverIconButton> createState() => _HoverIconButtonState();
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
            context.isDesktop ? AppSizes.d12.w : AppSizes.d8.w,
          ), // padding inside round bg
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.onSurface : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.onSurface,
              width: 2,
            ),
          ),
          child: SizedBox(
            width: context.isDesktop ? 18.w : 10.w,
            height: context.isDesktop ? 18.w : 10.w,
            child: SvgPicture.asset(
              widget.assetPath,
              width: widget.size,
              colorFilter: ColorFilter.mode(
                _isHovered ? tabHoverText : AppColors.onBackground,
                BlendMode.srcIn,
              ),
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
