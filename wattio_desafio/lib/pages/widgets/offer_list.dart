import 'package:flutter/material.dart';
import 'package:wattio_desafio/utils/constants.dart';

class OfferList extends StatelessWidget {
  final bool Function(Map<String, Object>) isOfferVisible;
  final int? selectedOfferIndex;
  final void Function(int) onOfferTap;

  const OfferList({
    super.key,
    required this.isOfferVisible,
    this.selectedOfferIndex,
    required this.onOfferTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        for (int index = 0; index < ofertas.length; index++)
          if (isOfferVisible(ofertas[index]))
            GestureDetector(
              onTap: () => onOfferTap(index),
              child: Card(
                color: selectedOfferIndex == index
                    ? Theme.of(context).colorScheme.inversePrimary
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text(
                      ofertas[index]['nome'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Desconto: ${((ofertas[index]['desconto']! as double) * 100).toStringAsFixed(2)}%',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
