import 'package:arslan_flutter_portfolio/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customThemes/app_color_scheme.dart';
import 'customThemes/elevated_button_theme.dart';
import 'customThemes/icon_button_theme.dart';
import 'customThemes/text_button_theme.dart';
import 'customThemes/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get desktop => ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    fontFamily: GoogleFonts.outfit().fontFamily,
    colorScheme: appColorScheme,
    textTheme: AppTextTheme.outfitTextThemeDesktop,
    elevatedButtonTheme: AppElevatedButtonTheme.desktopElevatedButtonTheme,
    iconButtonTheme: AppIconButtonTheme.desktopIconButtonTheme,
    textButtonTheme: AppTextButtonTheme.desktopTextButtonTheme,
  );
  static ThemeData get mobile => ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    fontFamily: GoogleFonts.outfit().fontFamily,
    colorScheme: appColorScheme,
    textTheme: AppTextTheme.outfitTextThemeMobile,
    elevatedButtonTheme: AppElevatedButtonTheme.mobileElevatedButtonTheme,
    iconButtonTheme: AppIconButtonTheme.mobileIconButtonTheme,
    textButtonTheme: AppTextButtonTheme.mobileTextButtonTheme,
  );
}
