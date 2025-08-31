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
    return HoverableWidget(
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: AppSizes.d240.w,
          height: AppSizes.d100.h,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.d16.h,
            horizontal: AppSizes.d20.w,
          ),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(AppSizes.d12.r),
          ),
          child: Row(
            children: [
              /// Skill Icon
              SvgPicture.asset(
                iconPath,
                width: AppSizes.d40.w,
                height: AppSizes.d40.h,
                colorFilter: ColorFilter.mode(
                  isHovered ? AppColors.surface : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: AppSizes.d24.w),

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
                        fontSize: AppSizes.d20.sp,
                        fontWeight: FontWeight.w600,
                        color: isHovered
                            ? AppColors.surface
                            : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSizes.d12.h),

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
