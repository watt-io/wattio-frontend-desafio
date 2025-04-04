import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CustomColors.background,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.primary,
      surfaceTint: CustomColors.primaryVariant,
      secondary: CustomColors.secondary,
      error: CustomColors.error,
      background: CustomColors.background,
      surface: CustomColors.tertiary,
      tertiary: CustomColors.tertiary,
      onSurface: CustomColors.tertiary,
      onBackground: CustomColors.textColor,
      onPrimary: CustomColors.textColor,
      onError: CustomColors.error,
      onSecondary: CustomColors.textColor,
    ),
    primaryColor: CustomColors.primary,
  );
}

class CustomColors {
  static const Color primary = Color(0xFF17BDB6);
  static const Color primaryVariant = Color(0xFF4BD2BC);
  static const Color secondary = Color(0xFFE8E8E8); 
  static const Color error = Color(0xFFF47853);
  static const Color background = Color(0xFFF6F6F6);
  static const Color tertiary = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF1C1E33);
}
