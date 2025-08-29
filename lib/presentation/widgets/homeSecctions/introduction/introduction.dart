import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/sizes.dart';
import 'intro_text_block.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.d90.h,
        horizontal: AppSizes.d80.w,
      ),
      color: AppColors.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSizes.d635.w,
            height: AppSizes.d635.h,
            child: Image.asset(AppImages.profilePicture, fit: BoxFit.contain),
          ),
          SizedBox(width: AppSizes.d32.w),
          Expanded(
            child: IntroTextBlock(
              titleFontSize: AppSizes.d64.sp,
              subtitleFontSize: AppSizes.d18.sp,
              spacing: AppSizes.d54.h,
              bottomFontSize: 32.sp,
            ),
          ),
        ],
      ),
    );
  }
}
