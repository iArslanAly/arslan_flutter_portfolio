import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'education_card.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.educationTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: isDesktop ? 32.sp : 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isDesktop ? 24.h : 16.h),
        EducationCard(
          duration: TextStrings.educationDuration1,
          company: TextStrings.educationDegree1,
          role: TextStrings.educationInstitution1,
        ),
      ],
    );
  }
}
