import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:wattio/src/pages/home/components/monthly_discout_calculator.dart';


void main() {
  setUpAll(() {
    Intl.defaultLocale = 'pt_BR';
  });

  test('Calcula e formata desconto mensal corretamente', () {
    expect(
      calculateMontlhyDiscount(consumerSpending: 1200, discountValue: 0.0),
      'R\$ 100,00',
    );

    expect(
      calculateMontlhyDiscount(consumerSpending: 1200, discountValue: 0.5),
      'R\$ 50,00',
    );

    expect(
      calculateMontlhyDiscount(consumerSpending: 600, discountValue: 1.0),
      'R\$ 0,00',
    );

    expect(
      calculateMontlhyDiscount(consumerSpending: 3600, discountValue: 0.25),
      'R\$ 225,00',
    );
  });
}
