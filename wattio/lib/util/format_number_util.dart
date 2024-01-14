import 'package:intl/intl.dart';

/// A classe FormatNumberUtil fornece uma função estática para facilitar a formatação do número.
/// Essa classe encapsula a lógica relacionada à formatação de um número.
/// @author - Paulo Henrique Caserta

class FormatNumberUtil {
  static String formatarValor(double valor) {
    NumberFormat numberFormat = NumberFormat('#,##0.00', 'pt_BR');
    if (valor == 0) {
      return "0";
    }
    return numberFormat.format(valor);
  }
}
