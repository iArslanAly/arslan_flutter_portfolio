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

    return HoverableWidget(
      onTap: () {
        // 👉 Navigate to blog details if needed
        debugPrint("Clicked: ${blog['title']}");
      },
      builder: (isHovered) => Container(
        width: 390.w,
        height: 570.h,
        decoration: BoxDecoration(
          color: isHovered ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              blog["images"]!,
              width: 390.w,
              height: 260.h,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: EdgeInsets.all(24.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.secondary.withValues(alpha: 0.1),
                        ),
                        child: Text(
                          blog["category"]!,
                          style: theme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            height: 1,
                            color: isHovered
                                ? AppColors.onPrimary
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        blog["date"]!,
                        style: theme.bodySmall?.copyWith(
                          fontSize: 14.sp,
                          height: 1,
                          fontWeight: FontWeight.w600,
                          color: isHovered
                              ? AppColors.onPrimary.withValues(alpha: 0.8)
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  /// --- Title
                  Text(
                    blog["title"]!,
                    style: theme.titleMedium?.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: isHovered
                          ? AppColors.onPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  /// --- Description
                  Text(
                    blog["description"]!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: isHovered
                          ? AppColors.onPrimary.withValues(alpha: 0.9)
                          : AppColors.textSecondary,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  /// --- Action
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      blog["action"]!,
                      style: theme.labelLarge?.copyWith(
                        fontSize: 16.sp,
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
