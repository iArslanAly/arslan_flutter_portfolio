import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutItems = <MapEntry<String, String>>[
      MapEntry(TextStrings.labelName, TextStrings.name),
      MapEntry(TextStrings.labelEmail, TextStrings.email),
      MapEntry(TextStrings.labelPhone, TextStrings.phone),
      MapEntry(TextStrings.labelNationality, TextStrings.nationality),
      MapEntry(TextStrings.labelExperience, TextStrings.experience),
      MapEntry(TextStrings.labelFreelance, TextStrings.freelance),
      MapEntry(TextStrings.labelLanguages, TextStrings.languages),
    ];

    return Padding(
      padding: EdgeInsets.all(context.isDesktop ? 20.w : 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextStrings.aboutMeTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: context.isDesktop ? 32.sp : 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: context.isDesktop ? 32.h : 12.h),
          Text(
            TextStrings.aboutMeSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: context.isDesktop ? 16.sp : 12.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: context.isDesktop ? 32.h : 12.h),
          ...aboutItems.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: context.isDesktop ? 16.h : 8.h),
              child: AboutMeItem(label: item.key, value: item.value),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMeItem extends StatelessWidget {
  const AboutMeItem({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Better alignment for multi-line values
      children: [
        SizedBox(
          width: 150.w, // Fixed width for labels to align values
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: context.isDesktop ? 18.sp : 10.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: context.isDesktop ? 24.sp : 12.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
