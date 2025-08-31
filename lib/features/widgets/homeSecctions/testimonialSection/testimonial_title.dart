import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_strings.dart';

class TestimonialTitle extends StatelessWidget {
  TestimonialTitle({super.key});

  final List<Map<String, String>> bottomItemsData = [
    {'title': '15+', 'subtitle': 'Projects\nCompleted'},
    {'title': '12+', 'subtitle': 'stars'}, // special case for stars
  ];

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
                  TextStrings.testimonialLabel.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: AppSizes.d20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: AppSizes.d16.h),
                Text(
                  TextStrings.testimonialTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: AppSizes.d48.sp,
                    color: AppColors.textPrimary,
                    height: 1,
                  ),
                ),
                SizedBox(height: AppSizes.d20.h),
              ],
            ),
          ),

          /// Right side items
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bottomItemsData.map((item) {
              return Padding(
                padding: EdgeInsets.only(right: AppSizes.d40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontSize: AppSizes.d55.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    /// Check if it's the "stars" section
                    item['subtitle'] == 'stars'
                        ? Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.primary,
                                size: AppSizes.d20.sp,
                              );
                            }),
                          )
                        : Text(
                            item['subtitle']!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: AppSizes.d18.sp,
                                  color: AppColors.textSecondary,
                                ),
                          ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
