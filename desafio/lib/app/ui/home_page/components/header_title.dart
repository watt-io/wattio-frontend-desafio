import 'package:desafio/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          surfaceTintColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Watt-io', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              Image.asset('assets/images/energy.png', height: 50, width: 50),
              const SizedBox(width: 20),
              const Text('Energy', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Calcule sua economia baseado em seu consumo médio de energia elétrica.',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        const SizedBox(height: 20),
        const Text('Selecione a forma de contratação.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
