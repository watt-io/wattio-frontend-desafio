import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/models/cooperativa.dart';

class CooperCard extends StatelessWidget {
  final Cooperativa coperativa;
  final bool selected;
  final Function(Cooperativa) onSelected;

  const CooperCard({
    Key? key,
    required this.coperativa,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: GestureDetector(
        onTap: () {
          onSelected(coperativa);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Card(
            color: selected ? Colors.green : const Color(0xffff420e),
            elevation: 6,
            shadowColor: Colors.black.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<Cooperativa>(
                        value: coperativa,
                        groupValue: selected ? coperativa : null,
                        onChanged: (_) => onSelected(coperativa),
                      ),
                      const Text('Oferta'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Cooperativa: '),
                        Text(
                          coperativa.nome,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Colors.black,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Economia: '),
                        Text('${coperativa.desconto * 100} %'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
