import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/widgets/cta.dart';
import '../../../core/widgets/hoverable_widget.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ensure constraints
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.d90.h,
        horizontal: AppSizes.d80.w,
      ),
      color: AppColors.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
            width: AppSizes.d635.w,
            height: AppSizes.d635.h,
            child: Image.asset(AppImages.profilePicture, fit: BoxFit.contain),
          ),

          SizedBox(width: AppSizes.d32.w), // horizontal spacing
          // Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    TextStrings.introductionLabel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: AppSizes.d26.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.d8.h),
              Text(
                TextStrings.heroTitle2,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(fontSize: AppSizes.d64.sp),
              ),

              SizedBox(height: AppSizes.d16.h),
              RichText(
                text: TextSpan(
                  text: TextStrings.heroTitle3,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: AppSizes.d44.sp,
                    height: 1.1,
                  ),
                  children: [
                    TextSpan(
                      text: TextStrings.heroTitle3Highlight,
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(
                            color: AppColors.primary,
                            fontSize: AppSizes.d44.sp,
                          ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSizes.d35.h),
              SizedBox(
                width: AppSizes.d570.w,
                child: Text(
                  TextStrings.introductionSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.d18.sp,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.d50.h),
              Row(
                children: [
                  /// Let's Talk Button
                  CTA(
                    onPressed: () {
                      // Your button logic (e.g. open contact form)
                    },
                  ),
                  SizedBox(width: AppSizes.d50.w),

                  /// Download CV Button
                  HoverableWidget(
                    onTap: () {
                      // Your button logic (e.g. download CV)
                    },
                    builder: (isHovered) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              TextStrings.downloadCv,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: isHovered
                                        ? AppColors.textAccent
                                        : AppColors.textPrimary,
                                    fontSize: AppSizes.d15.sp,
                                  ),
                            ),
                            SizedBox(width: AppSizes.d8.w),
                            SvgPicture.asset(
                              AppImages.download,
                              colorFilter: ColorFilter.mode(
                                isHovered
                                    ? AppColors.textAccent
                                    : AppColors.textPrimary,
                                BlendMode.srcIn,
                              ),
                              height: AppSizes.d28.h,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: AppSizes.d54.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// Bottom Line
                      Text(
                        TextStrings.heroBottomLine,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: AppSizes.d8.w),
                      Text(
                        TextStrings.heroBottomLineSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.d18.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: AppSizes.d40.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// Bottom Line
                      Text(
                        TextStrings.heroBottomLine,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: AppSizes.d8.w),
                      Text(
                        TextStrings.heroBottomLineSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.d18.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: AppSizes.d40.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      /// Bottom Line
                      Text(
                        TextStrings.heroBottomLine,
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: AppSizes.d8.w),
                      Text(
                        TextStrings.heroBottomLineSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.d18.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
