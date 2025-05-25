import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/pages/home/components/convert_percent_pattern.dart';



void main() {
  test('formatDiscountPercentage formata corretamente para pt_BR', () {
    expect(formatDiscountPercentage(0.1), '10%');
    expect(formatDiscountPercentage(0.25), '25%');
    expect(formatDiscountPercentage(0), '0%');
    expect(formatDiscountPercentage(1), '100%');
  });
}
