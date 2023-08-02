import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) return newValue;

    double value =
        double.parse(newValue.text.replaceAll(RegExp(r'[^0-9]'), '')) / 100.0;

    NumberFormat numberFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    String formattedValue = numberFormat.format(value);

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

String formatCurrency(double value) {
  String formattedValue = value.toStringAsFixed(2).replaceAll('.', ',');

  final parts = formattedValue.split(',');
  final intPart = parts[0].replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]}.',
  );

  return 'R\$ $intPart,${parts[1]}';
}
