import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 2.w,
      toolbarHeight: 56.h,
      titleSpacing: 16.w,
      title: Text(
        'Ali.',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
        ),
      ),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.secondary,
                padding: EdgeInsets.all(8.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              icon: Icon(Icons.menu, size: 18.sp, color: AppColors.surface),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          },
        ),
      ],
    );
  }
}
