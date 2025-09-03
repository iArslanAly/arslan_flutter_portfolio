import 'package:arslan_flutter_portfolio/features/home/data/repository.dart';
import 'package:arslan_flutter_portfolio/features/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/widgets/hover_icon_button.dart';
import '../../../../core/widgets/hoverable_widget.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  static const List<Map<String, String>> navLinks = [
    {'label': 'HOME', 'route': RouteNames.home},
    {'label': 'SERVICES', 'route': RouteNames.services},
    {'label': 'CONTACT', 'route': RouteNames.contact},
    {'label': 'ABOUT', 'route': RouteNames.about},
    {'label': 'PORTFOLIO', 'route': RouteNames.portfolio},
    {'label': 'BLOGS', 'route': RouteNames.blogs},
  ];

  bool _isDesktop(BuildContext context) => context.isDesktop;

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
          padding: EdgeInsets.symmetric(horizontal: context.isDesktop ? 16.w : 8.w, vertical: context.isDesktop ? 12.h : 8.h),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isSelected
                  ? AppColors.primary
                  : (isHovered ? AppColors.textAccent : AppColors.surface),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: _isDesktop(context) ? AppSizes.d15.sp : AppSizes.d10.sp,
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconRow(BuildContext context, {bool center = false}) {
    final iconSize = context.isDesktop ? AppSizes.d20.w : AppSizes.d12.w;
    final icons = <Widget>[
      HoverIconButton(
        assetPath: AppImages.facebook,
        size: iconSize,
        normalColor: AppColors.surface,
        hoverColor: AppColors.primary,
        onTap: () => HomeRepository().launchAppUrl(
          'https://www.facebook.com/iarslanaly',
        ),
      ),
      SizedBox(width: context.isDesktop ? AppSizes.d12.w : AppSizes.d8.w),
      HoverIconButton(
        assetPath: AppImages.twitter,
        normalColor: AppColors.surface,
        hoverColor: AppColors.primary,
        size: iconSize,
        onTap: () =>
            HomeRepository().launchAppUrl('https://www.twitter.com/iarslanaly'),
      ),
      SizedBox(width: context.isDesktop ? AppSizes.d12.w : AppSizes.d8.w),
      HoverIconButton(
        assetPath: AppImages.linkedin,
        size: iconSize,
        normalColor: AppColors.surface,
        hoverColor: AppColors.primary,
        onTap: () => HomeRepository().launchAppUrl(
          'https://www.linkedin.com/in/iarslanaly',
        ),
      ),
      SizedBox(width: context.isDesktop ? AppSizes.d12.w : AppSizes.d8.w),
      HoverIconButton(
        assetPath: AppImages.github,
        size: iconSize,
        normalColor: AppColors.surface,
        hoverColor: AppColors.primary,
        onTap: () =>
            HomeRepository().launchAppUrl('https://www.github.com/iarslanaly'),
      ),
    ];

    return Row(
      mainAxisAlignment: center
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: icons,
    );
  }

  Widget _buildCopyright(BuildContext context) {
    return Text(
      'Copyright © 2025 Arslan Ali | All Rights Reserved.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: AppSizes.d12.sp,
        color: AppColors.textSecondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = _isDesktop(context);

    return Padding(
      padding: EdgeInsets.only(
        top: isDesktop ? 16.h : 24.h,
        left: isDesktop ? 40.w : 16.w,
        right: isDesktop ? 40.w : 16.w,
        bottom: isDesktop ? 16.h : 12.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Navigation links
          Row(
            mainAxisSize: MainAxisSize.min,
            children: navLinks.map((link) {
              return _navItem(
                context,
                link['label']!,
                route: link['route']!,
                onTap: () => context.go(link['route']!),
              );
            }).toList(),
          ),

          SizedBox(height: isDesktop ? 24.h : 16.h),

          // Divider
          Divider(
            color: AppColors.textSecondary.withValues(alpha: 0.5),
            thickness: 1,
          ),
          SizedBox(height: isDesktop ? 24.h : 16.h),

          // Bottom row
          Responsive(
            desktop: Row(
              children: [
                Expanded(child: Center(child: _buildCopyright(context))),
                const Spacer(),
                Expanded(child: _buildIconRow(context, center: false)),
              ],
            ),
            mobile: Column(
              children: [
                _buildIconRow(context, center: true),
                SizedBox(height: 12.h),
                _buildCopyright(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
