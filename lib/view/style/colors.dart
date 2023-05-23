import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.white;
  static const Color onPrimary = Color(0xFF140005);
  static const Color secondary = Color(0xFF7E7C73);
  static const Color onSecondary = Color(0xFFBBC4C2);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color error = Colors.red;
  static const Color onError = Colors.redAccent;
  static const Color background = Color(0xFF4E545C);
  static const Color onBackground = Color(0xFFE5E8E8);
  static const Brightness brightness = Brightness.dark;

  static ColorScheme get colorScheme => const ColorScheme(
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        brightness: AppColors.brightness,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onError,
      );
}
