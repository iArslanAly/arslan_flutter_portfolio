import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showDivider; // <-- control divider visibility

  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showDivider = true, // default true
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: isDesktop ? AppSizes.d56.h : AppSizes.d34.h,
              width: isDesktop ? AppSizes.d56.w : AppSizes.d34.w,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: AppColors.surface,
                size: isDesktop ? AppSizes.d28.sp : AppSizes.d20.sp,
              ),
            ),
            SizedBox(width: isDesktop ? AppSizes.d16.w : AppSizes.d8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: isDesktop ? AppSizes.d16.sp : AppSizes.d12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  value,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: isDesktop ? AppSizes.d20.sp : AppSizes.d14.sp,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (showDivider) ...[
          SizedBox(height: isDesktop ? AppSizes.d12.h : AppSizes.d4.h),
          SizedBox(
            width: isDesktop ? AppSizes.d420.w : AppSizes.d220.w,
            child: Divider(
              color: AppColors.textSecondary.withValues(alpha: 0.6),
            ),
          ),
          SizedBox(height: isDesktop ? AppSizes.d12.h : AppSizes.d8.h),
        ],
      ],
    );
  }
}
