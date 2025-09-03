import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

import '../routes/route_names.dart';
import 'cta.dart';
import 'hoverable_widget.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final VoidCallback onNavTogglePressed;

  const DesktopAppBar({
    super.key,
    
    required this.onNavTogglePressed,
  });

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
              _navItem(
                context,
                'HOME',
                route: RouteNames.home,
                onTap: () => context.go(RouteNames.home),
              ),
              _navItem(
                context,
                'SERVICES',
                route: RouteNames.services,
                onTap: () => context.go(RouteNames.services),
              ),
              _navItem(
                context,
                'CONTACT',
                route: RouteNames.contact,
                onTap: () => context.go(RouteNames.contact),
              ),
              _navItem(
                context,
                'ABOUT',
                route: RouteNames.about,
                onTap: () => context.go(RouteNames.about),
              ),
              _navItem(
                context,
                'PORTFOLIO',
                route: RouteNames.portfolio,
                onTap: () => context.go(RouteNames.portfolio),
              ),
              _navItem(
                context,
                'BLOGS',
                route: RouteNames.blogs,
                onTap: () => context.go(RouteNames.blogs),
              ),
            ],
          ),

          // Trailing CTA and nav button
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CTA(onPressed: () => context.go(RouteNames.contact)),
              SizedBox(width: 12.w),
              IconButton(
                icon: Icon(Icons.menu, size: 16.sp),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.d24.w,
                    vertical: AppSizes.d16.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.d4.r),
                  ),
                ),
                onPressed: () {},
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
    required String route,
    required VoidCallback onTap,
  }) {
    final currentLocation = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();

    final bool isSelected = currentLocation == route;

    return HoverableWidget(
      onTap: onTap,
      builder: (isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isSelected
                  ? AppColors.primary
                  : (isHovered ? AppColors.textAccent : AppColors.textPrimary),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: AppSizes.d15.sp,
            ),
          ),
        );
      },
    );
  }
}
