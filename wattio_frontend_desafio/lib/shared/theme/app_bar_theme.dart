import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/shared/theme/color_theme.dart';

class CustomAppBarTheme {
  AppBarTheme call() {
    return const AppBarTheme(
      backgroundColor: CustomColorTheme.primary,
    );
  }
}
