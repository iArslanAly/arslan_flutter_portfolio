import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationCard extends StatelessWidget {
  final String duration;
  final String company;
  final String role;

  const EducationCard({
    super.key,
    required this.duration,
    required this.company,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    return HoverableWidget(
      builder: (isHovered) {
        // 🎨 Define text styles once
        final durationStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: isDesktop ? AppSizes.d14.sp : AppSizes.d10.sp,
          fontWeight: FontWeight.w500,
          color: isHovered ? AppColors.surface : AppColors.textSecondary,
        );

        final companyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: isDesktop ? AppSizes.d18.sp : AppSizes.d12.sp,
          fontWeight: FontWeight.w500,
          color: isHovered ? AppColors.surface : AppColors.textPrimary,
        );

        final roleStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: isDesktop ? AppSizes.d24.sp : AppSizes.d16.sp,
          fontWeight: FontWeight.bold,
          color: isHovered ? AppColors.surface : AppColors.textPrimary,
        );

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isDesktop
              ? AppSizes.d140.h
              : null, // 👈 auto height on mobile
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.d24.w,
            vertical: AppSizes.d16.h,
          ),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(isDesktop ? 8.r : 4.r),
          ),

          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Duration
                    Text(duration, style: durationStyle),
                    SizedBox(width: AppSizes.d48.w),

                    /// Company + Role
                    _buildCompanyAndRole(
                      companyStyle,
                      roleStyle,
                      isHovered,
                      isDesktop,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Duration
                    Text(duration, style: durationStyle),
                    SizedBox(height: AppSizes.d8.h),

                    /// Company + Role
                    _buildCompanyAndRole(
                      companyStyle,
                      roleStyle,
                      isHovered,
                      isDesktop,
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildCompanyAndRole(
    TextStyle? companyStyle,
    TextStyle? roleStyle,
    bool isHovered,
    bool isDesktop,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Company with dot
        Row(
          children: [
            Container(
              width: AppSizes.d8.w,
              height: AppSizes.d8.h,
              decoration: BoxDecoration(
                color: isHovered ? AppColors.surface : AppColors.primary,
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
            SizedBox(width: isDesktop ? AppSizes.d8.w : AppSizes.d4.w),
            Text(company, style: companyStyle),
          ],
        ),

        SizedBox(height: AppSizes.d4.h),

        /// Role
        Text(role, style: roleStyle),
      ],
    );
  }
}
