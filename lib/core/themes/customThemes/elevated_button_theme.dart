import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final desktopElevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColors.onSurface; // Define this color in AppColors
        }
        if (states.contains(WidgetState.pressed)) {
          return AppColors.primary; // Define this color as well
        }
        return AppColors.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primary; // Define this color
        }
        return AppColors.onPrimary;
      }),
      elevation: WidgetStateProperty.resolveWith<double>((states) {
        if (states.contains(WidgetState.hovered)) {
          return 8.0; // Raised elevation on hover
        }
        return 4.0; // Default elevation
      }),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: AppSizes.d32, vertical: AppSizes.d16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.d4),
        ),
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: AppSizes.d16, fontWeight: FontWeight.w600),
      ),
      side: WidgetStateProperty.all(BorderSide.none),
    ),
  );

  static final mobileElevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primary),
      foregroundColor: WidgetStateProperty.all(AppColors.onPrimary),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: AppSizes.d10, vertical: AppSizes.d7),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.d4),
        ),
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: AppSizes.d12, fontWeight: FontWeight.w600),
      ),
      side: WidgetStateProperty.all(BorderSide.none),
      elevation: WidgetStateProperty.all(4.0),
    ),
  );
}
