import 'package:intl/intl.dart';

class AppConverters {
  static String doubleToRealString(double value) {
    final formatedValue = value.toStringAsFixed(2).replaceAll('.', ',');
    final parts = formatedValue.split(',');
    final valorFinal =
        'R\$ ${parts[0].replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')},${parts[1]}';
    return valorFinal;
  }

  static String formatarPorcentagem(double valor) {
    return NumberFormat.percentPattern().format(valor);
  }
}
