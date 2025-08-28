import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/images.dart';

class CTA extends StatelessWidget {
  final VoidCallback onPressed;

  const CTA({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.d24.w,
          vertical: AppSizes.d16.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.d4.r),
        ),
      ),

      child: Row(
        children: [
          Text(
            TextStrings.heroButton,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontSize: AppSizes.d15.sp,
            ),
          ),
          SizedBox(width: AppSizes.d8.w),
          SvgPicture.asset(
            AppImages.arrowUpRight,
            colorFilter: ColorFilter.mode(AppColors.onPrimary, BlendMode.srcIn),
            height: AppSizes.d28.h,
          ),
        ],
      ),
    );
  }
}
