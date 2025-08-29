import 'package:flutter/material.dart';
import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';

class AppIconButtonTheme {
  AppIconButtonTheme._();

  static IconButtonThemeData get desktopIconButtonTheme {
    return IconButtonThemeData(
      style:
          IconButton.styleFrom(
            backgroundColor: AppColors.onSurface,
            foregroundColor: AppColors.surface,
            padding: EdgeInsets.all(AppSizes.d16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.d4),
            ),
            iconSize: AppSizes.d24,
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primary;
              }
              return AppColors.onSurface;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.surface;
              }
              return AppColors.onPrimary;
            }),
          ),
    );
  }

  static final mobileIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      padding: EdgeInsets.all(AppSizes.d8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.d4),
      ),
      iconSize: AppSizes.d20,
    ),
  );
}
