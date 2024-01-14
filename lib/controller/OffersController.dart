import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/Offers.dart';

class OffersController {
  late Future<List<Offer>> getOffersListFuture;

  final _formatter = NumberFormat('#,###,###.00');

  bool isValidateMoney = false;
  late Offer currentOffer;
  late String personType;

  void init(String text, bool isPhysicalPerson) {
    personType = fisicaOuJurisica(isPhysicalPerson);
    getOffersListFuture = listOffersFilter(textRegex(text));
  }

  Future<List<Offer>> _listAllOffers() async {
    var response = await rootBundle.loadString("assets/offers.json");

    if (response.isNotEmpty) {
      return parseOffers(response);
    } else {
      return [];
    }
  }

  Future<List<Offer>> listOffersFilter(String currentValue) async {
    var value = double.parse(textRegex(currentValue));

    List<Offer> list = await _listAllOffers();

    return list
        .where((element) =>
            double.parse(element.valorMinimoMensal) <= value &&
            double.parse(element.ValorMaximoMensal) >= value &&
            personType == element.fisicaOuJurisica)
        .toList();
  }

  String descontoFormat(String value) {
    var v = value.replaceAll('.', '');

    if (v.length > 1) {
      return '$v %';
    } else {
      return '${v}0 %';
    }
  }

  String annualSavings(String value, String text) {
    if (verifyRangeValue(text)) {
      var desconto = double.parse("0$value");

      var money = double.parse(textRegex(text));

      var annualValue = money * 12;

      return _formatter.format(desconto * annualValue).toString();
    } else {
      return "0";
    }
  }

  String toFormat(String text) => _formatter.format(num.parse(text)).toString();

  String textRegex(String text) =>
      text.replaceAll("R\$\:", "").split(",").join("");

  String annualAverage(String value, String text) {
    if (verifyRangeValue(text)) {
      var desconto = double.parse("0$value");

      var money = double.parse(textRegex(text));

      var annualValue = money * 12;

      var v = desconto * annualValue;

      return _formatter.format(v / 12).toString();
    } else {
      return "0";
    }
  }

  void setNewFilter(String text) {
    var value = textRegex(text);

    if (double.parse(value) >= 1000.00 && double.parse(value) <= 100000.00) {
      getOffersListFuture = listOffersFilter(value);
    }
  }

  bool verifyRangeValue(String text) {
    var value = textRegex(text);

    if (value.isEmpty) {
      return false;
    }

    return (double.parse(value) >= 1000.00 && double.parse(value) <= 100000.00);
  }

  String fisicaOuJurisica(bool isPhysicalPerson) {
    if (isPhysicalPerson) {
      return "fisica";
    } else {
      return "juridica";
    }
  }
}
