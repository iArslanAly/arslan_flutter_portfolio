import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme outfitTextThemeDesktop = TextTheme(
    // Hero heading1
    displayLarge: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 84,
      fontWeight: FontWeight.w800,
    ),

    displayMedium: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 64,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 48,
      fontWeight: FontWeight.w800,

      letterSpacing: -1.5,
    ),
    headlineLarge: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 44,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 42,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    // Hero paragraph
    titleLarge: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    // Subheading or medium label (26px)
    titleMedium: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 26,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 18,
      fontWeight: FontWeight.w500,

      textBaseline: TextBaseline.alphabetic,
      color: AppColors.textPrimary,
    ),

    bodyLarge: GoogleFonts.outfit(
      color: AppColors.textSecondary,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.outfit(
      color: AppColors.textSecondary,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),

    bodySmall: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,

      color: AppColors.textSecondary,
    ),

    labelLarge: GoogleFonts.outfit(
      color: AppColors.onPrimary,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.outfit(
      fontSize: 14,
      fontWeight: FontWeight.w500,

      color: AppColors.textSecondary,
    ),
    labelSmall: GoogleFonts.outfit(
      fontSize: 12,
      fontWeight: FontWeight.w600,

      letterSpacing: 0,
      color: AppColors.textSecondary,
    ),
  );
  static TextTheme outfitTextThemeMobile = TextTheme(
    // Hero heading1
    displayLarge: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 34,
      fontWeight: FontWeight.w800,
    ),

    displayMedium: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),

    headlineLarge: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      letterSpacing: -1.5,
    ),

    titleLarge: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    titleMedium: GoogleFonts.outfit(
      color: AppColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    titleSmall: GoogleFonts.outfit(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.textPrimary,
    ),

    bodyLarge: GoogleFonts.outfit(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyMedium: GoogleFonts.outfit(
      color: AppColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    labelMedium: GoogleFonts.outfit(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.onPrimary,
    ),
    labelSmall: GoogleFonts.outfit(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: AppColors.textSecondary,
    ),
  );
}
