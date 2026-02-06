import 'package:flutter/material.dart';
import '../models/cooperativa.dart';
import '../utils/app_colors.dart';

class OfertaCard extends StatelessWidget {
  final List<Cooperativa> offers;
  final Cooperativa? selected;
  final ValueChanged<Cooperativa> onSelect;

  const OfertaCard({
    super.key,
    required this.offers,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(offers.length, (i) {
        final coop = offers[i];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio<String>(
                value: coop.nome,
                groupValue: selected?.nome,
                onChanged: (_) => onSelect(coop),
                activeColor: AppColors.orange,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oferta ${i + 1}',
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Cooperativa ',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: coop.nome,
                            style: TextStyle(color: AppColors.textDark),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Economia: ',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${(coop.desconto * 100).toStringAsFixed(0)} %',
                            style: TextStyle(color: AppColors.textDark),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
