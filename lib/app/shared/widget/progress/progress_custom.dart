import 'package:flutter/material.dart';

class ProgressCustom extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? strokeWidth;

  const ProgressCustom(
      {super.key,
      this.value,
      this.backgroundColor,
      this.color,
      this.valueColor,
      this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      backgroundColor: backgroundColor,
      color: color ?? Colors.white,
      valueColor: valueColor,
      strokeWidth: strokeWidth ?? 4.0,
    );
  }
}
