import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/shared/theme/app_bar_theme.dart';
import 'package:wattio_frontend_desafio/shared/theme/color_theme.dart';
import 'package:wattio_frontend_desafio/shared/theme/text_theme.dart';

class CustomTheme {
  ThemeData call(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: CustomColorTheme.primary),
      scaffoldBackgroundColor: CustomColorTheme.primary,
      textTheme: CustomTextTheme()(),
      appBarTheme: CustomAppBarTheme()(),
    );
  }
}
