import 'package:flutter/material.dart';

class ProposalCardWidgetWeb extends StatelessWidget {
  final String nome;
  final int valorMinimoMensal;
  final int valorMaximoMensal;
  final double desconto;
  final double value;
  const ProposalCardWidgetWeb(
      {super.key,
      required this.nome,
      required this.valorMinimoMensal,
      required this.valorMaximoMensal,
      required this.desconto,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Minha economia anual sera de até',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'R\$${((value * desconto) * 12).toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 24, color: Colors.greenAccent.shade700),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Em media ',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'R\$${(value * desconto).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16, color: Colors.greenAccent.shade700),
                      ),
                      const TextSpan(
                        text: ' Por mês',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Essa é apenas uma simulação não configura garantia de desconto.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text(
                        'Parabens',
                        style: TextStyle(fontSize: 30),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Fechar'),
                        )
                      ],
                    ),
                  ),
                  child: const Text('Contratar'),
                )
              ],
            ),
          ),
        ),
      ),
      child: SizedBox(
        height: size.height * 0.16,
        width: size.width * 0.3,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent.shade100,
                  Colors.cyanAccent.shade100,
                  Colors.blue.shade100,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Coperativa:',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: nome,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Desconto:',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: '%${desconto * 100}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
