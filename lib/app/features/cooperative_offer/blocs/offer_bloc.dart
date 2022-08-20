import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import 'offer_event.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvents, OfferState> {

  OfferBloc() : super(OfferStateNormal()) {
    on<OfferLoadingEvent>(
      (event, emit) => emit(OfferStateLoading())
    );

    on<OfferNormalEvent>(
      (event, emit) => emit(OfferStateNormal()),
    );
  }

  String calculateSavingsMonthly(double price, double savingsPercentage) {
    final double savingsMonthly = price * savingsPercentage;
    return formatPrice(savingsMonthly);
  }

  String calculateSavingsYearly(double price, double savingsPercentage) {
    final double savingsYearly = price * savingsPercentage * 12;
    return formatPrice(savingsYearly);
  }

  String formatPrice(double price) => 
      'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
  
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