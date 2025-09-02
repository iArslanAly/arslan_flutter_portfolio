import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';

class SkillCard extends StatelessWidget {
  final String iconPath;
  final String skillName;
  final double progressValue;

  const SkillCard({
    super.key,
    required this.iconPath,
    required this.skillName,
    required this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return HoverableWidget(
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isDesktop ? AppSizes.d240.w : AppSizes.d100.w,
          height: isDesktop ? AppSizes.d100.h : AppSizes.d40.h,
          padding: EdgeInsets.symmetric(
            vertical: isDesktop ? AppSizes.d16.h : AppSizes.d8.h,
            horizontal: isDesktop ? AppSizes.d20.w : AppSizes.d12.w,
          ),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(
              isDesktop ? AppSizes.d12.r : AppSizes.d8.r,
            ),
          ),
          child: Row(
            children: [
              /// Skill Icon
              SvgPicture.asset(
                iconPath,
                width: isDesktop ? AppSizes.d40.w : AppSizes.d24.w,
                height: isDesktop ? AppSizes.d40.h : AppSizes.d24.h,
                colorFilter: ColorFilter.mode(
                  isHovered ? AppColors.surface : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: isDesktop ? AppSizes.d24.w : AppSizes.d12.w),

              /// Skill Name and Progress
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Skill Name
                    Text(
                      skillName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: isDesktop ? AppSizes.d20.sp : AppSizes.d10.sp,
                        fontWeight: isDesktop
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isHovered
                            ? AppColors.surface
                            : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(
                      height: isDesktop ? AppSizes.d12.h : AppSizes.d8.h,
                    ),

                    /// Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 8.h,
                        backgroundColor: AppColors.secondary.withValues(
                          alpha: 0.2,
                        ),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isHovered ? AppColors.surface : AppColors.primary,
                        ),
                      ),
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
