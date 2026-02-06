import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_colors.dart';

class Savings extends StatelessWidget {
  final double monthlySavings;

  Savings({super.key, required this.monthlySavings});

  final _brl = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    final annualSavings = monthlySavings * 12;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título
          const Text(
            'Minha economia anual será de até',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          // Valor anual
          Text(
            _brl.format(annualSavings),
            style: const TextStyle(
              color: AppColors.orange,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 12),

          // Média mensal
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 18),
              children: [
                const TextSpan(
                  text: 'Em média ',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: _brl.format(monthlySavings),
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const TextSpan(
                  text: ' por mês*',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Observação
          const Text(
            '*Essa é apenas uma simulação e não configura garantia do desconto.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
