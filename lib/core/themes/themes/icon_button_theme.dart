import 'package:flutter/material.dart';
import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';

class AppIconButtonTheme {
  AppIconButtonTheme._();

  static final desktopIconButtonTheme = IconButtonThemeData(
    style:
        IconButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          padding: EdgeInsets.all(AppSizes.d16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.d4),
          ),
          iconSize: AppSizes.d24,
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.surface;
            }
            return AppColors.primary;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.onSurface;
            }
            return AppColors.onPrimary;
          }),
        ),
  );

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
