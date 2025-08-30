// ignore_for_file: deprecated_member_use

import 'package:arslan_flutter_portfolio/core/constants/colors.dart';
import 'package:flutter/material.dart';

final ColorScheme appColorScheme = ColorScheme(
  brightness: Brightness.light,

  // PRIMARY
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  primaryContainer: AppColors.primary.withValues(alpha: 0.2),
  onPrimaryContainer: AppColors.onPrimary,

  // SECONDARY
  secondary: AppColors.surface,
  onSecondary: AppColors.onSurface,
  secondaryContainer: AppColors.surface.withValues(alpha: 0.5),
  onSecondaryContainer: AppColors.onSurface,

  // BACKGROUND
  background: AppColors.background,
  onBackground: AppColors.onBackground,

  // SURFACE
  surface: AppColors.surface,
  onSurface: AppColors.onSurface,

  // ERROR
  error: AppColors.error,
  onError: AppColors.onError,

  // OPTIONAL FIELDS (you can keep or customize further)
  outline: AppColors.textSecondary.withValues(alpha: 0.4),
  outlineVariant: AppColors.textSecondary.withValues(alpha: 0.2),
  inverseSurface: AppColors.onBackground,
  onInverseSurface: AppColors.background,
  shadow: Colors.black26,
  scrim: Colors.black45,
  surfaceTint: AppColors.primary,
);
