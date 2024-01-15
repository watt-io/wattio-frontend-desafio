import 'package:flutter/material.dart';

class SavingsDialog {
  static void show(BuildContext context, Map<String, dynamic> oferta, TextEditingController gastoMensalController) {
    int desconto = oferta['desconto'];
    double valorMensal = double.parse(gastoMensalController.text);

    double descontoPercentual = desconto / 100.0;
    double economiaMensal = valorMensal * descontoPercentual;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Economia Estimada'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Economia Mensal: R\$${economiaMensal.toStringAsFixed(2)}'),
              Text('Economia Anual: R\$${economiaMensal * 12.0}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
            TextButton(onPressed: () {}, child: const Text("Contratar"))
          ],
        );
      },
    );
  }
}
