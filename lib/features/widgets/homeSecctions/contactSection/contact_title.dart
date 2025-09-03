import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';

import '../../../../core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class ContextTitle extends StatelessWidget {
  const ContextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.contactLabel.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            fontSize: isDesktop ? AppSizes.d20.sp : AppSizes.d10.sp,
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isDesktop ? AppSizes.d48.sp : AppSizes.d18.sp,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: TextStrings.contactTitle, // "Latest Blogs"
                style: const TextStyle(color: AppColors.textPrimary),
              ),

              TextSpan(
                text: TextStrings.contactTitleHighlight, // " & "
                style: const TextStyle(color: AppColors.primary),
              ),
              TextSpan(
                text: TextStrings.contactTitle2, // "Articles"
                style: const TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),

        SizedBox(height: isDesktop ? AppSizes.d40.h : AppSizes.d20.h),
      ],
    );
  }
}
