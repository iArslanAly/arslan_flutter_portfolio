import 'package:flutter/material.dart';

/// AppColors
/// This class defines all colors used in the app for light theme.
/// Each color is named semantically based on its usage (not the color itself).
class AppColors {
  // ----------------------------
  // PRIMARY (Main brand color)
  // ----------------------------

  /// Main color used for buttons, hover states, links, etc.
  static const Color primary = Color(0xFF2E8B57); // Sea Green
  static const Color secondary = Color(0xFF252422); // Light Sea Green

  /// Text or icons on top of the primary color (e.g. white on green button)
  static const Color onPrimary = Color(0xFFE0EBDB); // Off-white

  // ----------------------------
  // SECONDARY / SURFACE
  // ----------------------------

  /// Used for tabs, sections, and surface-like elements
  static const Color surface = Color(0xFFE0EBDB); // Light pastel green

  /// Text/icons on top of surface (e.g. tab text)
  static const Color onSurface = Color(0xFF252422); // Dark brown/black

  // ----------------------------
  // BACKGROUND
  // ----------------------------

  /// General background (e.g. page background)
  static const Color background = Color(0xFFFFFCF2); // Cream / off-white

  /// Text/icons on top of background
  static const Color onBackground = Color(0xFF252422); // Dark brown/black

  // ----------------------------
  // TEXT STYLES
  // ----------------------------

  /// Headings / strong emphasis text
  static const Color textPrimary = Color(0xFF252422); // Same as onBackground

  /// Secondary text — paragraphs, captions, etc.
  static const Color textSecondary = Color(0xFF74787C); // Gray

  /// Accent text used in headings (e.g. half colored title)
  static const Color textAccent = Color(0xFF2E8B57); // Same as primary

  // ----------------------------
  // TAB STATE (Hover)
  // ----------------------------

  /// Hovered tab background — same as primary
  static const Color tabHoverBackground = primary;

  /// Hovered tab text — same as surface
  static const Color tabHoverText = surface;

  // ----------------------------
  // STATUS COLORS (Optional)
  // ----------------------------

  static const Color error = Color(0xFFB00020); // Red
  static const Color onError = Color(0xFFFFFFFF); // Text on red

  static const Color success = Color(0xFF4CAF50); // Green
  static const Color warning = Color(0xFFFFC107); // Amber
}
