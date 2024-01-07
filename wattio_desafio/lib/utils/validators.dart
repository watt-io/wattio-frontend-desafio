String? validateValorConta(String? value) {
  if (value == null || value.isEmpty) {
    return 'Informe o valor médio da conta de energia.';
  }

  double parsedValue = double.tryParse(
          value.replaceAll(RegExp(r'[^0-9]'), '').replaceAll('.', '')) ??
      0;
  parsedValue = parsedValue / 100;

  if (parsedValue < 1000) {
    return 'O valor mínimo deve ser R\$1.000,00.';
  } else if (parsedValue > 100000) {
    return 'O valor máximo deve ser R\$100.000,00.';
  }

  return null;
}
