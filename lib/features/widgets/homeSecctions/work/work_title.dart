import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/core/widgets/cta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkTitle extends StatelessWidget {
  const WorkTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 90.0.h,
        left: 80.0.w,
        right: 80.0.w,
        bottom: 50.0.h,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// CTA Section (left)
          SizedBox(
            width: AppSizes.d415.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings.workLabel.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: AppSizes.d20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: AppSizes.d16.h),
                Text(
                  TextStrings.workTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: AppSizes.d48.sp,
                    color: AppColors.textPrimary,
                    height: 1,
                  ),
                ),
                Text(
                  TextStrings.workSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: AppSizes.d18.sp,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: AppSizes.d20.h),
              ],
            ),
          ),
          CTA(onPressed: () {}, label: TextStrings.workButton),
        ],
      ),
    );
  }
}
