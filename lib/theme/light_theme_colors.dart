import 'package:desafio_wattio/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeColorsLight implements ThemeColors {
  @override
  var primaryColor = const Color.fromRGBO(4, 52, 60, 1);

  @override
  var secondaryColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  var tertiaryColor = const Color.fromRGBO(247, 236, 0, 1);

  @override
  var primaryBackgroundColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  var secondaryBackgroundColor = const Color.fromRGBO(7, 32, 41, 1);

  @override
  var primaryTextColor = const Color.fromRGBO(0, 0, 0, 1);

  @override
  var secondaryTextColor = const Color.fromRGBO(255, 255, 255, 1);

  @override
  var tertiaryTextColor = const Color.fromRGBO(154, 154, 157, 1);

  @override
  var shadedColor = const Color.fromRGBO(57, 57, 50, 0.5);
}
