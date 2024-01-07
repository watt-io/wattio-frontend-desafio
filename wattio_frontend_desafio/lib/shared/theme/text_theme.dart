import 'package:flutter/material.dart';

class CustomTextTheme {
  TextTheme call() {
    return const TextTheme(
      titleSmall: TextStyle(
        fontFamily: 'NotoSans',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontFamily: 'NotoSans',
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: TextStyle(
        fontFamily: 'NotoSans',
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: 'NotoSans',
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
