import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationCard extends StatelessWidget {
  final String duration;
  final String company;
  final String role;

  const EducationCard({
    super.key,
    required this.duration,
    required this.company,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),

          height: AppSizes.d140.h,
          padding: EdgeInsets.all(AppSizes.d24.w),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// Duration
              Text(
                duration,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: AppSizes.d14.sp,
                  fontWeight: FontWeight.w500,
                  color: isHovered
                      ? AppColors.surface
                      : AppColors.textSecondary,
                ),
              ),
              SizedBox(width: AppSizes.d48.w),

              /// Company name with dot
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: AppSizes.d8.w,
                        height: AppSizes.d8.h,
                        decoration: BoxDecoration(
                          color: isHovered
                              ? AppColors.surface
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      SizedBox(width: AppSizes.d8.w),
                      Text(
                        company,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.d18.sp,
                          fontWeight: FontWeight.w500,
                          color: isHovered
                              ? AppColors.surface
                              : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),

                  /// Role
                  Text(
                    role,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: AppSizes.d24.sp,
                      fontWeight: FontWeight.bold,
                      color: isHovered
                          ? AppColors.surface
                          : AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
