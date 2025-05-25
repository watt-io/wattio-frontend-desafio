import 'package:intl/intl.dart';

String calculateMontlhyDiscount({
  required int consumerSpending,
  required discountValue,
}) {
  final discounted = consumerSpending * (1 - discountValue);

  double monthlyDiscount = discounted / 12;

  final formattedValue = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
  ).format(monthlyDiscount);

  return formattedValue;
}
