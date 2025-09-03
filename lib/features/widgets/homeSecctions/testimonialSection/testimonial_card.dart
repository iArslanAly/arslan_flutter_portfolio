import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TestimonialCard extends StatelessWidget {
  final String clientName;
  final String role;
  final String feedback;
  final int rating;
  final String imagePath;

  const TestimonialCard({
    super.key,
    required this.clientName,
    required this.role,
    required this.feedback,
    this.rating = 5,
    this.imagePath = AppImages.client,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isDesktop = context.isDesktop;

    return HoverableWidget(
      builder: (isHovered) => Container(
        width: isDesktop ? 550.w : 270.w,
        height: isDesktop ? 345.h : 160.h,
        padding: EdgeInsets.all(isDesktop ? 40.h : 16.h),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// --- Top Section (Avatar + Name + Role + Stars)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Avatar + Info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: AssetImage(imagePath),
                    ),
                    SizedBox(width: isDesktop ? 16.w : 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clientName,
                          style: theme.titleMedium?.copyWith(
                            fontSize: isDesktop ? 18.sp : 12.sp,
                            fontWeight: FontWeight.bold,
                            color: isHovered
                                ? AppColors.onPrimary
                                : AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          role,
                          style: theme.bodyMedium?.copyWith(
                            fontSize: isDesktop ? 14.sp : 10.sp,
                            color: isHovered
                                ? AppColors.onPrimary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// Stars
                Row(
                  children: List.generate(
                    rating,
                    (_) => Icon(
                      Icons.star,
                      color: isHovered
                          ? AppColors.onPrimary
                          : AppColors.primary,
                      size: isDesktop ? AppSizes.d20.sp : AppSizes.d10.sp,
                    ),
                  ),
                ),
              ],
            ),

            /// --- Feedback Text
            Text(
              feedback,
              style: theme.bodyLarge?.copyWith(
                fontSize: isDesktop ? 18.sp : 10.sp,
                color: isHovered ? AppColors.onPrimary : AppColors.textPrimary,
                height: 1.5,
              ),
            ),

            /// --- Quote Icon
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                AppImages.quote,
                width: isDesktop ? 40.w : 14.w,
                height: isDesktop ? 40.h : 14.h,
                colorFilter: ColorFilter.mode(
                  isHovered ? AppColors.onPrimary : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
