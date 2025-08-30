import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/experience_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.experienceTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            ExperienceCard(
              duration: TextStrings.experienceDuration1,
              company: TextStrings.experienceCompany1,
              role: TextStrings.experienceRole1,
            ),
            SizedBox(width: 16.w),
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
