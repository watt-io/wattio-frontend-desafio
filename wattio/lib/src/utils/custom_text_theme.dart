import 'package:flutter/material.dart';
import 'package:wattio/src/utils/app_theme.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.style,
    this.align,
    this.weight,
    this.size,
    this.color,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final FontStyle? style;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.center,
      maxLines: maxLines ?? 1,
      textScaleFactor: 1,

      style: TextStyle(
        color: color ?? WattioColors.primary,
        fontFamily: 'Nunito',
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.w500,
        fontStyle: style ?? FontStyle.normal,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
