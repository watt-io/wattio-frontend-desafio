import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:wattio/src/pages/home/components/discount_calculator.dart';



void main() {
  setUpAll(() {
    Intl.defaultLocale = 'pt_BR';
  });

  test('Calcula e formata valor com desconto corretamente', () {
    expect(
      setDiscountValue(consumerSpending: 100, discountValue: 0.1),
      'R\$ 90,00',
    );

    expect(
      setDiscountValue(consumerSpending: 200, discountValue: 0.25),
      'R\$ 150,00',
    );

    expect(
      setDiscountValue(consumerSpending: 500, discountValue: 0),
      'R\$ 500,00',
    );

    expect(
      setDiscountValue(consumerSpending: 1000, discountValue: 1),
      'R\$ 0,00',
    );
  });
}
