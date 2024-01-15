import 'package:flutter/material.dart';

class DialogHelper {
  static void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showSavingsDialog(BuildContext context, Map<String, dynamic> oferta, TextEditingController gastoMensalController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Economia Estimada'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Economia Mensal: R\$${_calculateMonthlySavings(oferta, gastoMensalController)}'),
              Text('Economia Anual: R\$${_calculateAnnualSavings(oferta, gastoMensalController)}'),
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

  static String _calculateMonthlySavings(Map<String, dynamic> oferta, TextEditingController gastoMensalController) {
    int desconto = oferta['desconto'];
    double valorMensal = double.parse(gastoMensalController.text);
    double descontoPercentual = desconto / 100.0;
    double economiaMensal = valorMensal * descontoPercentual;
    return economiaMensal.toStringAsFixed(2);
  }

  static String _calculateAnnualSavings(Map<String, dynamic> oferta, TextEditingController gastoMensalController) {
    double monthlySavings = double.parse(_calculateMonthlySavings(oferta, gastoMensalController));
    return (monthlySavings * 12.0).toStringAsFixed(2);
  }
}
