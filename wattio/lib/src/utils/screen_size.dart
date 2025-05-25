import 'package:flutter/material.dart';

class ScreenSize {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double height(BuildContext context) => screenSize(context).height;

  static double width(BuildContext context) => screenSize(context).width;
}
