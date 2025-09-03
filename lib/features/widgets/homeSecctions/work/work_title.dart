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
    final isDesktop = context.isDesktop;
    return Container(
      padding: EdgeInsets.only(
        top: isDesktop ? 90.0.h : 24.0.h,
        left: isDesktop ? 80.0.w : 16.0.w,
        right: isDesktop ? 80.0.w : 16.0.w,
        bottom: isDesktop ? 50.0.h : 24.0.h,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// CTA Section (left)
          SizedBox(
            width: isDesktop ? AppSizes.d415.w : AppSizes.d220.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings.workLabel.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: isDesktop ? AppSizes.d20.sp : AppSizes.d10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: isDesktop ? AppSizes.d16.h : AppSizes.d2.h),
                Text(
                  TextStrings.workTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: isDesktop ? AppSizes.d48.sp : AppSizes.d18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    height: 1,
                  ),
                ),
                Text(
                  TextStrings.workSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: isDesktop ? AppSizes.d18.sp : AppSizes.d12.sp,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: isDesktop ? AppSizes.d20.h : AppSizes.d8.h),
              ],
            ),
          ),
          CTA(onPressed: () {}, label: TextStrings.workButton),
        ],
      ),
    );
  }
}
