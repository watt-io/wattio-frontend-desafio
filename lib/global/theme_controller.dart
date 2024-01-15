import 'package:desafio_wattio/theme/light_theme_colors.dart';
import 'package:desafio_wattio/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class GlobalsThemeVar extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;

  late ThemeColors themeColors = ThemeColorsLight();
}