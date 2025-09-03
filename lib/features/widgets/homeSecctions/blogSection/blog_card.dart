import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';

class BlogCard extends StatelessWidget {
  final Map<String, String> blog;

  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isDesktop = context.isDesktop;

    return HoverableWidget(
      onTap: () {
        // 👉 Navigate to blog details if needed
        debugPrint("Clicked: ${blog['title']}");
      },
      builder: (isHovered) => Container(
        width: isDesktop ? AppSizes.d390.w : AppSizes.d220.w,
        height: isDesktop ? AppSizes.d570.h : AppSizes.d320.h,
        decoration: BoxDecoration(
          color: isHovered ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(
            isDesktop ? AppSizes.d8.r : AppSizes.d4.r,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withValues(alpha: 0.1),
              blurRadius: AppSizes.d6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              blog["images"]!,
              width: isDesktop ? AppSizes.d390.w : AppSizes.d220.w,
              height: isDesktop ? AppSizes.d260.h : AppSizes.d150.h,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.all(
                isDesktop ? AppSizes.d24.h : AppSizes.d12.h,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? AppSizes.d8.w : AppSizes.d4.w,
                          vertical: isDesktop ? AppSizes.d4.h : AppSizes.d2.h,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            isDesktop ? AppSizes.d8.r : AppSizes.d4.r,
                          ),
                          color: AppColors.secondary.withValues(alpha: 0.1),
                        ),
                        child: Text(
                          blog["category"]!,
                          style: theme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: isDesktop
                                ? AppSizes.d14.sp
                                : AppSizes.d10.sp,
                            height: 1,
                            color: isHovered
                                ? AppColors.onPrimary
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: isDesktop ? AppSizes.d8.w : AppSizes.d4.w,
                      ),
                      Text(
                        blog["date"]!,
                        style: theme.bodySmall?.copyWith(
                          fontSize: isDesktop
                              ? AppSizes.d14.sp
                              : AppSizes.d10.sp,
                          height: 1,
                          fontWeight: FontWeight.w600,
                          color: isHovered
                              ? AppColors.onPrimary.withValues(alpha: 0.8)
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isDesktop ? AppSizes.d12.h : AppSizes.d6.h),

                  /// --- Title
                  Text(
                    blog["title"]!,
                    style: theme.titleMedium?.copyWith(
                      fontSize: isDesktop ? AppSizes.d22.sp : AppSizes.d14.sp,
                      fontWeight: FontWeight.bold,
                      color: isHovered
                          ? AppColors.onPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: isDesktop ? AppSizes.d12.h : AppSizes.d6.h),

                  /// --- Description
                  Text(
                    blog["description"]!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.bodyMedium?.copyWith(
                      fontSize: isDesktop ? AppSizes.d16.sp : AppSizes.d12.sp,
                      color: isHovered
                          ? AppColors.onPrimary.withValues(alpha: 0.9)
                          : AppColors.textSecondary,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: isDesktop ? AppSizes.d24.h : AppSizes.d12.h),

                  /// --- Action
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      blog["action"]!,
                      style: theme.labelLarge?.copyWith(
                        fontSize: isDesktop ? AppSizes.d16.sp : AppSizes.d12.sp,
                        fontWeight: FontWeight.w600,
                        color: isHovered
                            ? AppColors.onPrimary
                            : AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
