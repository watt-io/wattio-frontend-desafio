import 'package:flutter/material.dart';
import 'package:projeto_teste_wattio/app/shared/models/cooperativa_model.dart';

import '../../shared/theme_colors.dart';
import '../../shared/widgets/app_bar_default.dart';
import '../../shared/widgets/card_details_coop.dart';

class TodasCoopsPage extends StatelessWidget {
  final List<CooperativeModel> cooperatives;
  final double valueEnergy;
  const TodasCoopsPage({
    Key? key,
    required this.cooperatives,
    required this.valueEnergy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundWhite,
      appBar: const AppBarDefault(
        title: 'Todas Cooperativas',
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            mainAxisExtent: 180,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemCount: cooperatives.length,
          itemBuilder: (context, i) {
            return CardDetailsCoop(
              cooperative: cooperatives[i],
              valueEnergy: valueEnergy,
              isAllCoop: true,
            );
          },
        ),
      ),
    );
  }
}
