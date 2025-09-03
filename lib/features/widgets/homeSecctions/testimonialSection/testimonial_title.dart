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
          SizedBox(
            width: isDesktop ? AppSizes.d415.w : AppSizes.d180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextStrings.testimonialLabel.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: isDesktop ? AppSizes.d20.sp : AppSizes.d10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: isDesktop ? AppSizes.d16.h : AppSizes.d2.h),
                Text(
                  TextStrings.testimonialTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: isDesktop ? AppSizes.d48.sp : AppSizes.d18.sp,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                SizedBox(height: isDesktop ? AppSizes.d20.h : AppSizes.d10.h),
              ],
            ),
          ),

          /// Right side items
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bottomItemsData.map((item) {
              return Padding(
                padding: EdgeInsets.only(
                  right: isDesktop ? AppSizes.d40.w : AppSizes.d12.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontSize: isDesktop
                                ? AppSizes.d55.sp
                                : AppSizes.d18.sp,
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
                                size: isDesktop
                                    ? AppSizes.d20.sp
                                    : AppSizes.d10.sp,
                              );
                            }),
                          )
                        : Text(
                            item['subtitle']!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: isDesktop
                                      ? AppSizes.d18.sp
                                      : AppSizes.d12.sp,
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
