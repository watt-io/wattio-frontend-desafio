import 'package:flutter/material.dart';

class ThemeColor {
  static const Color primaryColor = Color.fromARGB(255, 149, 189, 250);
  static const Color secondaryColor = Color.fromARGB(255, 253, 173, 0);
  static const Color darkColor = Color.fromARGB(255, 50, 106, 190);
  static const Color lightColor = Color.fromARGB(255, 206, 222, 247);

  static const Color backgroundWhite = Colors.white;

  double defaultTextFontSize = 13;
  double defaultBottomBarFontSize = 13;
  double defaultTitleFontSize = 14;
  double defaultNewsTitleFontSize = 18;

  static ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: ThemeColor.primaryColor,
      backgroundColor: ThemeColor.backgroundWhite,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: ThemeColor.secondaryColor),
    );
  }
}
