// lib/features/sections/introduction/widgets/intro_text_block.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../core/widgets/cta.dart';
import '../../../../core/widgets/hoverable_widget.dart';

class IntroTextBlock extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;
  final double spacing;
  final double bottomFontSize;

  IntroTextBlock({
    super.key,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.spacing,
    required this.bottomFontSize,
  });
  final List<Map<String, String>> bottomItemsData = [
    {'title': '15+', 'subtitle': 'Projects Completed'},
    {'title': '12+', 'subtitle': 'Worldwide client'},
    {'title': '10+', 'subtitle': 'Happy Clients'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.introductionLabel,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: subtitleFontSize),
        ),
        SizedBox(height: AppSizes.d8.h),
        Text(
          TextStrings.heroTitle2,
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: titleFontSize),
        ),
        SizedBox(height: AppSizes.d16.h),
        RichText(
          text: TextSpan(
            text: TextStrings.heroTitle3,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: titleFontSize * 0.7,
              height: 1.1,
            ),
            children: [
              TextSpan(
                text: TextStrings.heroTitle3Highlight,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: titleFontSize * 0.7,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSizes.d35.h),
        SizedBox(
          width: AppSizes.d570.w,
          child: Text(
            TextStrings.introductionSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: subtitleFontSize,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        SizedBox(height: AppSizes.d50.h),

        /// CTA Buttons
        Row(
          children: [
            CTA(onPressed: () {}),
            SizedBox(width: AppSizes.d50.w),
            HoverableWidget(
              onTap: () {},
              builder: (isHovered) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Text(
                      TextStrings.downloadCv,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isHovered
                            ? AppColors.textAccent
                            : AppColors.textPrimary,
                        fontSize: AppSizes.d15.sp,
                      ),
                    ),
                    SizedBox(width: AppSizes.d8.w),
                    SvgPicture.asset(
                      AppImages.download,
                      height: AppSizes.d28.h,
                      colorFilter: ColorFilter.mode(
                        isHovered
                            ? AppColors.textAccent
                            : AppColors.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: spacing),

        /// Bottom Line Items
        Row(
          children: bottomItemsData.map((item) {
            return Padding(
              padding: EdgeInsets.only(right: AppSizes.d40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: bottomFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSizes.d8.h),
                  Text(
                    item['subtitle']!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSizes.d18.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
