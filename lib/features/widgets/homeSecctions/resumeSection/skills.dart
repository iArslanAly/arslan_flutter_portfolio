import 'package:arslan_flutter_portfolio/core/constants/raw_data.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'skill_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text(
          TextStrings.skillsTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: isDesktop ? 32.sp : 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isDesktop ? 24.h : 12.h),

        /// Responsive Grid
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = isDesktop ? 3 : 2;
            final spacing = isDesktop ? 24.w : 12.w;

            final itemWidth =
                (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
                crossAxisCount;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: skills.map((skill) {
                return SizedBox(
                  width: itemWidth,
                  child: SkillCard(
                    iconPath: skill['icon'] as String,
                    skillName: skill['label'] as String,
                    progressValue: skill['value'] as double,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
