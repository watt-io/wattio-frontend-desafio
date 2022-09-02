import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../widgets/widgets.dart';
import 'offer_event.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvents, OfferState> {

  late final String savingsMonthly;

  late final String savingsYearly;

  late final String savingsPercentage;

  late final ArgumentsModel args;

  final currencyFormatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    name: 'R\$',
    decimalDigits: 2,
  );

  OfferBloc() : super(OfferStateNormal()) {
    on<OfferLoadingEvent>(
      (event, emit) => emit(OfferStateLoading())
    );

    on<OfferNormalEvent>(
      (event, emit) => emit(OfferStateNormal()),
    );
  }

  void getSavingsValues() {
    final double savingsPercentageDouble =
          args.offer.savingsPercentage * 100;

      if (savingsPercentageDouble -
          savingsPercentageDouble.floor() > 0.01) {
        savingsPercentage =
            '''${savingsPercentageDouble.toStringAsFixed(2)}%''';
      } else {
        savingsPercentage =
            '''${savingsPercentageDouble.toStringAsFixed(0)}%''';
      }
      
      savingsMonthly = calculateSavingsMonthly(
          args.valueOfEnergyAcount, args.offer.savingsPercentage);
      
      savingsYearly = calculateSavingsYearly(
          args.valueOfEnergyAcount, args.offer.savingsPercentage);
  }

  String calculateSavingsMonthly(double price, double savingsPercentage) {
    final double savingsMonthly = price * savingsPercentage;
    return formatPrice(savingsMonthly);
  }

  String calculateSavingsYearly(double price, double savingsPercentage) {
    final double savingsYearly = price * savingsPercentage * 12;
    return formatPrice(savingsYearly);
  }

  String formatPrice(double price) {

    final String result = currencyFormatter
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: price.toStringAsFixed(2)),
        )
        .text;

    return result;
  }
      
  
  void showLoadingDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) => const LoadingDialog(),
    );
  }

  void closeLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}