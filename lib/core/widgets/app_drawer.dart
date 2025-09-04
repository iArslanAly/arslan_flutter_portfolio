import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../routes/route_names.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo / Title at top
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.d24.h),
              child: Text(
                "Ali.",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),

            const Divider(thickness: 1),

            SizedBox(height: AppSizes.d24.h),

            // Navigation Items (centered)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _drawerItem(context, label: "Home", route: RouteNames.home),
                  _drawerItem(
                    context,
                    label: "Services",
                    route: RouteNames.services,
                  ),
                  _drawerItem(
                    context,
                    label: "Contact",
                    route: RouteNames.contact,
                  ),
                  _drawerItem(context, label: "About", route: RouteNames.about),
                  _drawerItem(
                    context,
                    label: "Portfolio",
                    route: RouteNames.portfolio,
                  ),
                  _drawerItem(context, label: "Blogs", route: RouteNames.blogs),
                ],
              ),
            ),

            // Call-to-action Button at bottom
            Padding(
              padding: EdgeInsets.all(AppSizes.d20.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.d4.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.d14.h,
                    horizontal: AppSizes.d40.w,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.go(RouteNames.contact);
                },
                child: Text(
                  "Let's Talk",
                  style: TextStyle(
                    fontSize: AppSizes.d12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: AppSizes.d16.h),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required String label,
    required String route,
  }) {
    final currentLocation = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();

    final bool isSelected = currentLocation == route;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.d12.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          context.go(route);
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: AppSizes.d18.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? AppColors.primary : AppColors.textPrimary,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
