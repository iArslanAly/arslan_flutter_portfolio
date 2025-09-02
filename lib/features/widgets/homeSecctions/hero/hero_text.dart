import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../core/widgets/cta.dart';
import '../../../../core/widgets/hover_icon_button.dart';
import '../../../../core/widgets/hoverable_widget.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Top line + Title 1
        Row(
          children: [
            SvgPicture.asset(
              AppImages.line,
              width: context.isDesktop ? AppSizes.d54.w : AppSizes.d30.w,
            ),
            SizedBox(
              width: context.isDesktop ? AppSizes.d25.w : AppSizes.d12.w,
            ),
            Text(
              TextStrings.heroLabel,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: context.isDesktop ? AppSizes.d26.sp : AppSizes.d14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: context.isDesktop ? AppSizes.d8.h : AppSizes.d4.h),

        /// Title 2
        Text(
          TextStrings.heroTitle2,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: context.isDesktop ? AppSizes.d84.sp : AppSizes.d34.sp,
          ),
        ),
        SizedBox(height: context.isDesktop ? AppSizes.d16.h : AppSizes.d12.h),

        /// Title 3 with Highlight
        RichText(
          text: TextSpan(
            text: TextStrings.heroTitle3,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: context.isDesktop ? AppSizes.d64.sp : AppSizes.d24.sp,
              height: 1.1,
            ),
            children: [
              TextSpan(
                text: TextStrings.heroTitle3Highlight,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primary,
                  fontSize: context.isDesktop
                      ? AppSizes.d64.sp
                      : AppSizes.d24.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.isDesktop ? AppSizes.d35.h : AppSizes.d20.h),

        /// Subtitle
        SizedBox(
          width: context.isDesktop ? AppSizes.d570.w : AppSizes.d300.w,
          child: Text(
            TextStrings.heroSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              fontSize: context.isDesktop ? AppSizes.d18.sp : AppSizes.d12.sp,
            ),
          ),
        ),
        SizedBox(height: context.isDesktop ? AppSizes.d50.h : AppSizes.d25.h),

        /// CTA buttons
        Row(
          children: [
            CTA(
              onPressed: () {
                // contact form action
              },
            ),
            SizedBox(
              width: context.isDesktop ? AppSizes.d50.w : AppSizes.d25.w,
            ),
            HoverableWidget(
              onTap: () {
                // download CV action
              },
              builder: (isHovered) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        TextStrings.downloadCv,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: isHovered
                              ? AppColors.textAccent
                              : AppColors.textPrimary,
                          fontSize: context.isDesktop
                              ? AppSizes.d15.sp
                              : AppSizes.d12.sp,
                        ),
                      ),
                      SizedBox(width: AppSizes.d8.w),
                      SvgPicture.asset(
                        AppImages.download,
                        colorFilter: ColorFilter.mode(
                          isHovered
                              ? AppColors.textAccent
                              : AppColors.textPrimary,
                          BlendMode.srcIn,
                        ),
                        height: AppSizes.d28.h,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: context.isDesktop ? AppSizes.d54.h : AppSizes.d22.h),

        /// Bottom line + social icons
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TextStrings.heroBottomLine,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: context.isDesktop ? 44.sp : 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: AppSizes.d8.w),
            Text(
              TextStrings.heroBottomLineSubtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: context.isDesktop ? AppSizes.d18.sp : AppSizes.d12.sp,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: context.isDesktop ? AppSizes.d32.w : AppSizes.d8.w),

            Container(
              height: context.isDesktop ? AppSizes.d32.h : AppSizes.d16.h,
              width: 1.w,
              color: AppColors.textPrimary,
            ),
            SizedBox(width: context.isDesktop ? AppSizes.d32.w : AppSizes.d8.w),

            Row(
              children: [
                HoverIconButton(
                  assetPath: AppImages.facebook,
                  size: context.isDesktop ? AppSizes.d34.w : AppSizes.d10.w,
                  onTap: () {},
                ),
                SizedBox(
                  width: context.isDesktop ? AppSizes.d16.w : AppSizes.d8.w,
                ),
                HoverIconButton(
                  assetPath: AppImages.twitter,
                  size: context.isDesktop ? AppSizes.d48.w : AppSizes.d10.w,
                  onTap: () {},
                ),
                SizedBox(
                  width: context.isDesktop ? AppSizes.d16.w : AppSizes.d8.w,
                ),
                HoverIconButton(
                  assetPath: AppImages.linkedin,
                  size: context.isDesktop ? AppSizes.d24.w : AppSizes.d10.w,
                  onTap: () {},
                ),
                SizedBox(
                  width: context.isDesktop ? AppSizes.d16.w : AppSizes.d8.w,
                ),
                HoverIconButton(
                  assetPath: AppImages.github,
                  size: context.isDesktop ? AppSizes.d24.w : AppSizes.d10.w,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
