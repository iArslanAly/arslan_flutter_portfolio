import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class BlogTitle extends StatelessWidget {
  const BlogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          TextStrings.blogLabel.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 48.sp,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: TextStrings.blogTitle, // "Latest Blogs"
                style: const TextStyle(color: AppColors.textPrimary),
              ),

              TextSpan(
                text: TextStrings.and, // " & "
                style: const TextStyle(color: AppColors.primary),
              ),
              TextSpan(
                text: TextStrings.blogTitleArticles, // "Articles"
                style: const TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),

        SizedBox(height: 40.h),
      ],
    );
  }
}
