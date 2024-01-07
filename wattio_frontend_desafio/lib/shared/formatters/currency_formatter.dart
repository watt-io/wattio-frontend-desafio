import 'package:flutter/services.dart';

class CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanedText.length > 6) {
      cleanedText = cleanedText.substring(0, 6);
    }

    int cursorOffset = newValue.selection.baseOffset;

    int parsedValue = int.parse(cleanedText);
    if (parsedValue < 1000 || parsedValue > 100000) {
      return oldValue.copyWith(
        text: _formatCurrency(oldValue.text.replaceAll(RegExp(r'[^\d]'), '')),
        selection: TextSelection.collapsed(offset: cursorOffset),
      );
    }

    String formattedValue = _formatCurrency(cleanedText);

    int newCursorOffset =
        cursorOffset + (formattedValue.length - cleanedText.length - 1);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: newCursorOffset),
    );
  }

  String _formatCurrency(String value) {
    int length = value.length;
    if (length <= 3) {
      return value;
    }

    String formattedValue = '';
    for (int i = 0; i < length; i++) {
      if (i != 0 && (length - i) % 3 == 0) {
        formattedValue += '.';
      }
      formattedValue += value[i];
    }
    return formattedValue;
  }
}
