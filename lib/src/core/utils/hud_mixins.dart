import 'package:flutter/material.dart';

mixin HudMixins {
  void showSnack(
    BuildContext context,
    String content,
    Color? color,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
    ));
  }
}
