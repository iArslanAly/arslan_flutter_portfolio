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
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: AppColors.surface, size: 28.sp),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  value,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (showDivider) ...[
          SizedBox(height: 12.h),
          SizedBox(
            width: 420.w,
            child: Divider(
              color: AppColors.textSecondary.withValues(alpha: 0.6),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ],
    );
  }
}
