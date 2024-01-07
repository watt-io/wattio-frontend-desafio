import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/shared/extensions/double_extension.dart';

class OfferDetailsWidget extends StatelessWidget {
  const OfferDetailsWidget(this.entity, this.value, {super.key});

  final CooperativeEntity entity;
  final int value;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        "Confira a economia!",
        style: Theme.of(context).textTheme.titleSmall!,
        textAlign: TextAlign.start,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Cooperativa: ${entity.name}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Desconto: ${entity.discount.formatAsPercentage()}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: 'Economia em 1 ano:\n',
              style: Theme.of(context).textTheme.displaySmall,
              children: [
                TextSpan(
                  text: 'R\$ ${((value * 12) * entity.discount).toInt()}',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Eu quero!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Talvez depois',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
