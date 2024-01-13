import 'package:flutter/material.dart';

/// Widget responsável pela criação e visualização do símbolo do cifrão personalizado.
/// @author Paulo Henrique Caserta

class CifraoWidget extends StatelessWidget {
  final double fontSize;
  final String fontFamily;
  final Color color;
  const CifraoWidget({
    super.key,
    required this.fontSize,
    required this.fontFamily,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$',
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
}
