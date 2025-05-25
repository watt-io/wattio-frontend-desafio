import 'package:intl/intl.dart';

String formatDiscountPercentage(double discount){
  final percentFormat = NumberFormat.percentPattern('pt_BR');
  return percentFormat.format(discount);
}