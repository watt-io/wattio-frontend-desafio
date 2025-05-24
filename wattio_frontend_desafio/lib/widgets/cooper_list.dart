import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/models/cooperativa.dart';
import 'package:wattio_frontend_desafio/widgets/cooper_card.dart';

class CooperList extends StatelessWidget {
  final List<Cooperativa> cooperativas;
  final Cooperativa? selectedCooperativa;
  final Function(Cooperativa) onSelected;

  const CooperList({
    Key? key,
    required this.cooperativas,
    required this.selectedCooperativa,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cooperativas.isEmpty) {
      return const Center(
        child: Text(
          "Sem oferta",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      );
    }

    return Container(
      height: 139,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cooperativas.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CooperCard(
            coperativa: cooperativas[index],
            selected: selectedCooperativa == cooperativas[index],
            onSelected: onSelected,
          ),
        ),
      ),
    );
  }
}
