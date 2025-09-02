import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images.dart';
import '../../../../core/constants/sizes.dart';
import '../../responsive.dart';
import 'intro_text_block.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: context.isDesktop ? AppSizes.d90.h : AppSizes.d24.h,
        horizontal: context.isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
      ),
      color: const Color.fromARGB(255, 253, 253, 253),
      child: Responsive(
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSizes.d635.w,
              height: AppSizes.d635.h,
              child: Image.asset(
                AppImages.profilePicture,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.low,
              ),
            ),
            SizedBox(width: AppSizes.d32.w),
            Expanded(
              child: IntroTextBlock(
                titleFontSize: context.isDesktop
                    ? AppSizes.d64.sp
                    : AppSizes.d24.sp,
                subtitleFontSize: AppSizes.d18.sp,
                spacing: context.isDesktop ? AppSizes.d54.h : AppSizes.d32.h,
                bottomFontSize: context.isDesktop
                    ? AppSizes.d32.sp
                    : AppSizes.d16.sp,
              ),
            ),
          ],
        ),
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSizes.d635.w,
              height: AppSizes.d635.h,
              child: Image.asset(
                AppImages.profilePicture,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.low,
              ),
            ),
            SizedBox(
              width: context.isDesktop ? AppSizes.d32.w : AppSizes.d12.w,
            ),
            Expanded(
              child: IntroTextBlock(
                titleFontSize: context.isDesktop
                    ? AppSizes.d64.sp
                    : AppSizes.d24.sp,
                subtitleFontSize: AppSizes.d12.sp,
                spacing: context.isDesktop ? AppSizes.d54.h : AppSizes.d32.h,
                bottomFontSize: context.isDesktop
                    ? AppSizes.d32.sp
                    : AppSizes.d16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
