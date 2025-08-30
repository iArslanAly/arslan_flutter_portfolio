import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/homeSecctions/resumeSection/education_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.educationTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24.h),
        EducationCard(
          duration: TextStrings.educationDuration1,
          company: TextStrings.educationDegree1,
          role: TextStrings.educationInstitution1,
        ),
      ],
    );
  }
}
