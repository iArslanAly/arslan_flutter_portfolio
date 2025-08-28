import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/core/widgets/cta.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hover_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/widgets/hoverable_widget.dart';

class AppHero extends StatelessWidget {
  const AppHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.heroBackgroundDesktop),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.d90.w,
          vertical: AppSizes.d60.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.line, width: AppSizes.d54.w),
                    SizedBox(width: AppSizes.d25.w),
                    Text(
                      TextStrings.heroTitle1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: AppSizes.d26.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.d8.h),
                Text(
                  TextStrings.heroTitle2,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontSize: AppSizes.d84.sp),
                ),

                SizedBox(height: AppSizes.d16.h),
                RichText(
                  text: TextSpan(
                    text: TextStrings.heroTitle3,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: AppSizes.d64.sp,
                      height: 1.1,
                    ),
                    children: [
                      TextSpan(
                        text: TextStrings.heroTitle3Highlight,
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(
                              color: AppColors.primary,
                              fontSize: AppSizes.d64.sp,
                            ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppSizes.d35.h),
                SizedBox(
                  width: AppSizes.d570.w,
                  child: Text(
                    TextStrings.heroSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: AppSizes.d18.sp,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.d50.h),
                Row(
                  children: [
                    /// Let's Talk Button
                    CTA(
                      onPressed: () {
                        // Your button logic (e.g. open contact form)
                      },
                    ),
                    SizedBox(width: AppSizes.d50.w),

                    /// Download CV Button
                    HoverableWidget(
                      onTap: () {
                        // Your button logic (e.g. download CV)
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
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color: isHovered
                                          ? AppColors.textAccent
                                          : AppColors.textPrimary,
                                      fontSize: AppSizes.d15.sp,
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
                SizedBox(height: AppSizes.d54.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    /// Bottom Line
                    Text(
                      TextStrings.heroBottomLine,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontSize: 44.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(width: AppSizes.d8.w),
                    Text(
                      TextStrings.heroBottomLineSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: AppSizes.d18.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: AppSizes.d32.w),

                    /// Vertical Divider
                    Container(
                      height: AppSizes.d32.h, // thickness
                      width: AppSizes.d1.w, // or whatever length you want
                      margin: EdgeInsets.symmetric(vertical: AppSizes.d20.w),
                      color: AppColors.textPrimary,
                    ),
                    SizedBox(width: AppSizes.d32.w),

                    /// Social Icons
                    Row(
                      children: [
                        HoverIconButton(
                          assetPath: AppImages.facebook,
                          size: AppSizes.d34,
                          onTap: () {
                            /* open facebook link */
                          },
                        ),
                        SizedBox(width: AppSizes.d16.w),
                        HoverIconButton(
                          assetPath: AppImages.twitter,
                          size: AppSizes.d48,
                          onTap: () {
                            /* open twitter link */
                          },
                        ),
                        SizedBox(width: AppSizes.d16.w),
                        HoverIconButton(
                          assetPath: AppImages.linkedin,
                          size: AppSizes.d48,
                          onTap: () {
                            /* open linkedin link */
                          },
                        ),
                        SizedBox(width: AppSizes.d16.w),
                        HoverIconButton(
                          assetPath: AppImages.instagram,
                          size: AppSizes.d48,
                          onTap: () {
                            /* open github link */
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            /// Hero Image
            Image.asset(
              AppImages.heroDesktop,
              width: MediaQuery.of(context).size.width >= 1440
                  ? 0.35.sw
                  : 0.6.sw,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
