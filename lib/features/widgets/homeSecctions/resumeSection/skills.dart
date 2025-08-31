import 'package:arslan_flutter_portfolio/core/constants/raw_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';

import 'skill_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.skillsTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 24.h),

        /// Grid (3 in a row)
        Wrap(
          spacing: 24.w,
          runSpacing: 24.h,
          children: skills.map((skill) {
            return SizedBox(
              width:
                  (ScreenUtil().screenWidth - 800.w) /
                  3, // Adjust spacing based on your layout
              child: SkillCard(
                iconPath: skill['icon'] as String,
                skillName: skill['label'] as String,
                progressValue: skill['value'] as double,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
