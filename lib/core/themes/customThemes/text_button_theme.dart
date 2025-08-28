// lib/core/theme/app_text_button_theme.dart

import 'package:flutter/material.dart';
import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/constants/sizes.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static final desktopTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary, // Text color
      textStyle: TextStyle(fontSize: AppSizes.d16, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.d20,
        vertical: AppSizes.d12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.d6),
      ),
    ),
  );

  static final mobileTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary, // Text color
      textStyle: TextStyle(fontSize: AppSizes.d14, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.d12,
        vertical: AppSizes.d8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.d4),
      ),
    ),
  );
}
