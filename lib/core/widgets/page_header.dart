import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class PageHeader extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;

  const PageHeader({
    super.key,
    required this.label,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isDesktop ? 800.w : 350.w),
      child: Column(
        children: [
          // Label
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: isDesktop ? AppSizes.d20.sp : AppSizes.d12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: AppSizes.d12.h),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: isDesktop ? AppSizes.d48.sp : AppSizes.d22.sp,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.d12.h),

          // Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: AppSizes.d16.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
