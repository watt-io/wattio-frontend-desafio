import 'package:flutter/material.dart';

class ProposalPageMobile extends StatelessWidget {
  final String nome;
  final int valorMinimoMensal;
  final int valorMaximoMensal;
  final double desconto;
  final double value;
  const ProposalPageMobile(
      {super.key,
      required this.nome,
      required this.valorMinimoMensal,
      required this.valorMaximoMensal,
      required this.desconto,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Oferta'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        flexibleSpace: Container(
          height: size.height * 0.2,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.cyan.shade300,
                  Colors.blue.shade300,
                  Colors.blueAccent
                ]),
          ),
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  nome,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: TextSpan(
                    text: 'Minha economia anual de',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'R\$${((value * desconto) * 12).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, color: Colors.greenAccent.shade700),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: RichText(
                  text: TextSpan(
                    text: 'Em media ',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'R\$${(value * desconto).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16, color: Colors.greenAccent.shade700),
                      ),
                      const TextSpan(
                        text: ' Por mês.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Essa é apenas uma simulação não configura garantia de desconto.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.cyan.shade300,
                          Colors.blue.shade300,
                          Colors.blueAccent
                        ]),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledForegroundColor:
                        Colors.transparent.withOpacity(0.38),
                    disabledBackgroundColor:
                        Colors.transparent.withOpacity(0.12),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text(
                        'Parabens',
                        style: TextStyle(fontSize: 30),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Fechar'),
                        )
                      ],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      'Contratar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
