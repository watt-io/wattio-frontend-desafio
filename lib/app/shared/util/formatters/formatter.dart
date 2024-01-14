import 'package:intl/intl.dart';

abstract class Formatter {

  static String currency(double value) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return currencyFormat.format(value);
  }
  
}