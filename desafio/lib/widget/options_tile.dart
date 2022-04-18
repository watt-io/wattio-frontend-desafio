import 'package:desafio/widget/text_with_type_and_body.dart';
import 'package:flutter/material.dart';

import 'package:desafio/class/plan.dart';

class OptionsTile extends StatelessWidget {
  final Plan plan;
  final bool isPar;

  const OptionsTile(
    this.plan, {
    this.isPar = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isPar ? const Color(0xFF3398FE) : const Color(0xFFFEBF00),
            width: 3,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithTypeAndBody('Nome', plan.name),
            const SizedBox(height: 5),
            TextWithTypeAndBody('Valor Mínimo Mensal', 'R\$ ' + plan.valueMinMonthly.toString()),
            const SizedBox(height: 5),
            TextWithTypeAndBody('Valor Máximo Mensal', 'R\$ ' + plan.valueMaxMonthly.toString()),
            const SizedBox(height: 5),
            TextWithTypeAndBody('Desconto', (plan.discount * 100).toStringAsFixed(2) + '%'),
          ],
        ),
      ),
    );
  }
}
