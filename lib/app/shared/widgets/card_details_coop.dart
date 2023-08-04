import 'package:flutter/material.dart';
import 'package:projeto_teste_wattio/app/shared/models/cooperativa_model.dart';

import '../formatters/formatters.dart';
import '../theme_colors.dart';

class CardDetailsCoop extends StatelessWidget {
  final CooperativeModel cooperative;
  double valueEnergy;

  //Usado para tela todas cooperativas
  bool isAllCoop;

  CardDetailsCoop(
      {super.key,
      required this.cooperative,
      required this.valueEnergy,
      this.isAllCoop = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Define a borda arredondada
        ),
        color: ThemeColor.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !isAllCoop,
                    child: const Text(
                      'MELHOR DESCONTO',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Cooperativa: ${cooperative.nome}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Desconto: ${Formatters.doubleToPercentage(cooperative.desconto!)}',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Valor a ser pago: ${Formatters.doubleToBRL(valueEnergy - (cooperative.desconto! * valueEnergy))}',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Economia de: ${Formatters.doubleToBRL(cooperative.desconto! * valueEnergy)}',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Aceita contas entre: ${Formatters.intToBRL(cooperative.valorMinimoMensal!)} a ${Formatters.intToBRL(cooperative.valorMaximoMensal!)}',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
