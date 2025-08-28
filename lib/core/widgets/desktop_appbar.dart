import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

import 'cta.dart';
import 'hoverable_widget.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCTAPressed;
  final VoidCallback onNavTogglePressed;

  const DesktopAppBar({
    Key? key,
    required this.onCTAPressed,
    required this.onNavTogglePressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2.w,
      titleSpacing: 20.w,
      toolbarHeight: 70.h, // Add this line!
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Leading brand/logo
          Center(
            child: Text(
              'Ali.',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.0, // (optional) tweak line height here if needed
              ),
            ),
          ),

          // Center navigation links
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _navItem(context, 'HOME', onTap: () {}),
              _navItem(context, 'SERVICES', onTap: () {}),
              _navItem(context, 'CONTACT', onTap: () {}),
              _navItem(context, 'ABOUT', onTap: () {}),
              _navItem(context, 'PORTFOLIO', onTap: () {}),
              _navItem(context, 'BLOGS', onTap: () {}),
            ],
          ),

          // Trailing CTA and nav button
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CTA(
                onPressed: () {
                  // Your button logic (e.g. open contact form)
                },
              ),
              SizedBox(width: 12.w),
              IconButton(
                icon: Icon(Icons.menu, size: 16.sp),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.d24.w,
                    vertical: AppSizes.d16.h,
                  ),
                ),
                color: AppColors.surface,
                onPressed: onNavTogglePressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    String label, {
    required VoidCallback onTap,
  }) {
    return HoverableWidget(
      onTap: onTap,
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isHovered ? AppColors.textAccent : AppColors.textPrimary,
              fontSize: AppSizes.d15.sp,
            ),
          ),
        );
      },
    );
  }
}
