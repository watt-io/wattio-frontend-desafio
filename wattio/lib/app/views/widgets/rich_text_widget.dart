import 'package:flutter/material.dart';

/// Widget responsável pela criação de um RichText personalizado.
/// @author Paulo Henrique Caserta

class RichTextWidget extends StatelessWidget {
  final String primeiraString;
  final String segundaString;
  final double primeiroFontSize;
  final double? segundoFontSize;
  final String? fontFamily;
  final Color primeiroColor;
  final Color? segundoColor;
  final TextAlign textAlign;

  const RichTextWidget({
    super.key,
    required this.primeiraString,
    required this.segundaString,
    required this.primeiroFontSize,
    this.segundoFontSize,
    this.fontFamily,
    required this.primeiroColor,
    this.segundoColor,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: TextStyle(
          color: primeiroColor,
          fontFamily: fontFamily,
          fontSize: primeiroFontSize,
        ),
        children: [
          TextSpan(
            text: '$primeiraString\n',
          ),
          TextSpan(
            text: segundaString,
            style: TextStyle(
              color: segundoColor,
              fontSize: segundoFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
