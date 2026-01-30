String formatCurrency(double value, {int decimals = 2}) {
  final fixed = value.toStringAsFixed(decimals);
  final parts = fixed.split('.');
  final withThousands = _addThousandsSeparator(parts[0]);
  final decimalPart = parts.length > 1 ? parts[1] : '';
  if (decimals == 0 || decimalPart.isEmpty) {
    return 'R\$ $withThousands';
  }
  return 'R\$ $withThousands,$decimalPart';
}

String formatPercent(double value, {int decimals = 0}) {
  return '${(value * 100).toStringAsFixed(decimals)}%';
}

String formatRange(double min, double max) {
  return '${formatCurrency(min, decimals: 0)} - ${formatCurrency(max, decimals: 0)}';
}

String formatMeses(int meses) {
  if (meses == 1) {
    return '1 mes';
  }
  return '$meses meses';
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
