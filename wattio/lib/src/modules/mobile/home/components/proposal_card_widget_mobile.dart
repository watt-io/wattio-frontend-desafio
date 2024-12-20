import 'package:flutter/material.dart';

class ProposalCardWidgetMobile extends StatelessWidget {
  final String nome;
  final int valorMinimoMensal;
  final int valorMaximoMensal;
  final double desconto;
  final double value;
  const ProposalCardWidgetMobile(
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
      onTap: () =>
          Navigator.pushNamed(context, '/ProposalPageMobile', arguments: {
        'nome': nome,
        'valorMinimoMensal': valorMinimoMensal,
        'valorMaximoMensal': valorMaximoMensal,
        'desconto': desconto,
        'value': value
      }),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.065,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      child: Stack(
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.blueAccent,
                              backgroundColor: Colors.white,
                              value: desconto,
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.center,
                            child: Text(
                              '%${(desconto * 100).toStringAsFixed(0)}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 9,
              width: size.width,
              child: const Card(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
