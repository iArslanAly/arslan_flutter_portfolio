import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CTA extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isSelected;

  /// ✅ New props for mobile expand/collapse
  final bool showExpandIcon;
  final bool isExpanded;

  const CTA({
    super.key,
    this.label = TextStrings.heroButton,
    required this.onPressed,
    this.isSelected = false,
    this.showExpandIcon = false,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.d24.w,
          vertical: AppSizes.d16.h,
        ),
        backgroundColor: isSelected ? AppColors.onSurface : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.d4.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Label
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.surface,
              fontSize: context.isDesktop ? AppSizes.d15.sp : AppSizes.d12.sp,
            ),
          ),

          /// Icon
          if (showExpandIcon)
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.surface,
              size: AppSizes.d24.h,
            )
          else
            SvgPicture.asset(
              AppImages.arrowUpRight,
              colorFilter: ColorFilter.mode(
                AppColors.onPrimary,
                BlendMode.srcIn,
              ),
              height: AppSizes.d24.h,
            ),
        ],
      ),
    );
  }
}
