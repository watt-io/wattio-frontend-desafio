import 'package:flutter/material.dart';

class NoOffers extends StatelessWidget {
  const NoOffers();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Nenhuma oferta disponível para esse valor.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
