import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import 'links.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Container(
      color: AppColors.secondary,
      padding: EdgeInsets.only(
        top: isDesktop ? AppSizes.d40.h : AppSizes.d20.h,
        left: isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
        right: isDesktop ? AppSizes.d80.w : AppSizes.d16.w,
        bottom: isDesktop ? AppSizes.d24.h : AppSizes.d20.h,
      ),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: isDesktop ? AppSizes.d34.sp : AppSizes.d14.sp,
                color: AppColors.surface,
                fontWeight: FontWeight.w600,
              ),
              children: const [
                TextSpan(text: 'Arslan '),

                TextSpan(
                  text: 'Ali',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
          FooterLinks(),
        ],
      ),
    );
  }
}
