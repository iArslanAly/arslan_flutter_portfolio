import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
// Adjust import path as needed

class ServiceCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    final double containerWidth = isMobile ? AppSizes.d160.w : AppSizes.d270.w;
    final double containerHeight = isMobile ? AppSizes.d160.h : AppSizes.d200.h;
    final double iconContainerSize = isMobile ? AppSizes.d40.w : AppSizes.d48.w;
    final double iconSize = isMobile ? AppSizes.d20.w : AppSizes.d24.w;
    final double fontSize = isMobile ? AppSizes.d14.sp : AppSizes.d18.sp;

    return HoverableWidget(
      onTap: onTap,
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: containerWidth,
          height: containerHeight,
          padding: EdgeInsets.all(AppSizes.d16.w),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(AppSizes.d20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon container (top-left)
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: iconContainerSize,
                  height: iconContainerSize,
                  decoration: BoxDecoration(
                    color: isHovered ? AppColors.surface : AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSizes.d100.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      width: iconSize,
                      height: iconSize,
                      color: isHovered
                          ? AppColors.onSurface
                          : AppColors.onPrimary,
                    ),
                  ),
                ),
              ),

              // Title and arrow (bottom-left)
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: isHovered
                              ? AppColors.surface
                              : AppColors.textPrimary,
                          height: 1.3,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/arrow_up_right.svg',
                      height: iconSize,
                      color: isHovered
                          ? AppColors.surface
                          : AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
