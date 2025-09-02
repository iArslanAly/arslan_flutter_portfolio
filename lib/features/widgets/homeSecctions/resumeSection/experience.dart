import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'experience_card.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.experienceTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: isDesktop ? 32.sp : 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isDesktop ? 24.h : 16.h),
        Row(
          children: [
            ExperienceCard(
              duration: TextStrings.experienceDuration1,
              company: TextStrings.experienceCompany1,
              role: TextStrings.experienceRole1,
            ),
            SizedBox(width: isDesktop ? 16.w : 8.w),
            ExperienceCard(
              duration: TextStrings.experienceDuration2,
              company: TextStrings.experienceCompany2,
              role: TextStrings.experienceRole2,
            ),
          ],
        ),
      ],
    );
  }
}
