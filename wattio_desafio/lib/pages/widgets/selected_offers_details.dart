import 'package:flutter/material.dart';
import 'package:wattio_desafio/utils/currency_formatter.dart';

class SelectedOfferDetails extends StatelessWidget {
  final int? selectedOfferIndex;
  final bool? validate;
  final double Function() calcularEconomiaAnual;
  final double Function() calcularEconomiaMensal;

  const SelectedOfferDetails({
    super.key,
    required this.selectedOfferIndex,
    required this.calcularEconomiaAnual,
    required this.calcularEconomiaMensal,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedOfferIndex != null) {
      return Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Economia Anual:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  formatCurrency(calcularEconomiaAnual()),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Economia Mensal: ${formatCurrency(calcularEconomiaMensal())}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              if (validate ?? false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Parabéns!'),
                      content:
                          const Text('Você contratou a oferta com sucesso!'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Contratar'),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
