import 'package:intl/intl.dart';

String setDiscountValue({
  required int consumerSpending,
  required double discountValue,
}) {
  final discounted = consumerSpending * (1 - discountValue);
  final formattedValue = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
  ).format(discounted);


  return formattedValue;
}
