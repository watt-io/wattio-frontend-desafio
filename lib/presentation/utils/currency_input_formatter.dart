import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final int decimalDigits;

  CurrencyInputFormatter({this.decimalDigits = 2});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Permite apenas numeros e virgula para controlar o formato monetario.
    var raw = newValue.text.replaceAll(RegExp(r'[^0-9,]'), '');
    if (raw.isEmpty) {
      return const TextEditingValue(text: '');
    }

    // Mantem o comportamento de "digitar centavos" ao final.
    final hasTrailingComma = raw.endsWith(',');
    final parts = raw.split(',');
    var intPart = parts.first;
    var decPart = parts.length > 1 ? parts.sublist(1).join('') : '';

    // Limita casas decimais para nao quebrar o layout.
    if (decPart.length > decimalDigits) {
      decPart = decPart.substring(0, decimalDigits);
    }

    intPart = _trimLeadingZeros(intPart);

    // Aplica separador de milhar e reconstrói o texto final.
    final formattedInt = _addThousandsSeparator(intPart);
    String text;
    if (decimalDigits > 0 && (decPart.isNotEmpty || hasTrailingComma)) {
      text = '$formattedInt,$decPart';
    } else {
      text = formattedInt;
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

String _trimLeadingZeros(String value) {
  final trimmed = value.replaceFirst(RegExp(r'^0+(?=.)'), '');
  return trimmed.isEmpty ? '0' : trimmed;
}

String _addThousandsSeparator(String digits) {
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    final positionFromEnd = digits.length - i;
    buffer.write(digits[i]);
    if (positionFromEnd > 1 && positionFromEnd % 3 == 1) {
      buffer.write('.');
    }
  }
  return buffer.toString();
}
