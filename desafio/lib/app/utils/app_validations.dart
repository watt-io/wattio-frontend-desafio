abstract class AppValidations {
  static String? amountValidator(String? value) {
    final amount = value ?? '';
    if (amount.isEmpty || amount == 'R\$ 0,00') return 'Valor está vazio.';
    return null;
  }
}
