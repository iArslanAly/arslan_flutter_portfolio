import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class ServicePageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback? onTap;

  const ServicePageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    final double cardWidth = isDesktop ? AppSizes.d400.w : AppSizes.d180.w;
    final double cardHeight = isDesktop ? AppSizes.d310.h : AppSizes.d160.h;
    final double iconSize = isDesktop ? AppSizes.d54.w : AppSizes.d18.w;

    return HoverableWidget(
      onTap: onTap,
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: cardWidth,
          height: cardHeight,
          padding: EdgeInsets.all(AppSizes.d16.w),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(
              isDesktop ? AppSizes.d20.r : AppSizes.d12.r,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered ? Colors.black26 : Colors.black12,
                blurRadius: isHovered ? 12 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              SvgPicture.asset(
                iconPath,
                width: iconSize,
                height: iconSize,
                colorFilter: ColorFilter.mode(
                  isHovered ? AppColors.surface : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: isDesktop ? AppSizes.d24.h : AppSizes.d8.h),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? AppSizes.d24.sp : AppSizes.d14.sp,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? AppColors.surface : AppColors.textPrimary,
                ),
              ),
              SizedBox(height: AppSizes.d8.h),

              // Subtitle
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? AppSizes.d12.sp : AppSizes.d10.sp,
                  color: isHovered
                      ? AppColors.surface
                      : AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
