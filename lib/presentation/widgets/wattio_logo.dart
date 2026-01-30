import 'package:flutter/material.dart';

class WattioLogo extends StatelessWidget {
  final double size;

  const WattioLogo({super.key, this.size = 96});

  @override
  Widget build(BuildContext context) {
    // Usa a logo oficial como asset para manter identidade visual.
    return Image.asset(
      'lib/assets/logo_app.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      semanticLabel: 'Logo Wattio',
    );
  }
}
