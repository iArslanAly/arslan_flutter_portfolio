import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:arslan_flutter_portfolio/core/themes/themes/app_color_scheme.dart';
import 'package:arslan_flutter_portfolio/core/themes/themes/elevated_button_theme.dart';
import 'package:arslan_flutter_portfolio/core/themes/themes/icon_button_theme.dart';
import 'package:arslan_flutter_portfolio/core/themes/themes/text_button_theme.dart';
import 'package:arslan_flutter_portfolio/core/themes/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
