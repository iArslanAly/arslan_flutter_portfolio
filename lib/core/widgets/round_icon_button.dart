import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const RoundIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style:
          IconButton.styleFrom(
            // no background at all
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.secondary,
            shape:
                const CircleBorder(), // purely for hit-test, doesn’t draw anything
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.secondary; // icon color on hover
              }
              return Colors.transparent; // normal icon color
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.surface; // icon color on hover
              }
              return AppColors
                  .secondary; // normal icon color (set your default here)
            }),
          ),
      onPressed: onPressed,
      icon: Icon(icon, size: AppSizes.d32.h),
    );
  }
}
