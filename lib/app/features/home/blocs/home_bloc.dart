import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';

import '../../../app.dart';
import '../repository/home_repository.dart';
import 'offer_list_events.dart';
import 'offer_list_state.dart';

class HomeBloc extends Bloc<OfferListEvents, OfferListState> {
  final HomeRepository _homeRepository = HomeRepository();

  final TextEditingController valueController = TextEditingController();

  final currencyFormatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    name: 'R\$',
  );

  double valueOfEnergyAcount = 0.0;
  
  HomeBloc() : super(OfferListStateInitial()) {
    on<OfferListInitialEvent>(
      (event, emit) => emit(OfferListStateInitial()),
    );

    on<OfferListLoadingEvent>(
      (event, emit) async {
        emit(OfferListStateLoading());
        try {
          final offers = await _homeRepository.getOffers();
          if (offers.isEmpty) {
            emit(OfferListStateEmpty());
          } else {
            emit(OfferListStateLoaded(offers: offers));
          }
        } on AppError catch (e) {
          emit(OfferListStateError('Erro na comunicação com o servidor: $e'));
        } 
        // catch (e) {
        //   log(e.toString());
        //   emit(OfferListStateError('Ops, algo deu errado'));
        // }
      },
    );
  }

  void increaseValue(int value, BuildContext context) {
    FocusScope.of(context).unfocus();
    valueOfEnergyAcount += value;
    valueController.text = currencyFormatter.format(
      valueOfEnergyAcount.toStringAsFixed(2),
    );
  }

  void decreasingValue(int value, BuildContext context) {
    print(valueOfEnergyAcount);
    FocusScope.of(context).unfocus();
    if (valueOfEnergyAcount > 0 && valueOfEnergyAcount - value > 0) {
      valueOfEnergyAcount -= value;
      
    } else {
      valueOfEnergyAcount = 0.0;
    }
    valueController.text = currencyFormatter.format(
      valueOfEnergyAcount.toStringAsFixed(2),
    );
  }

  void buildSnackBar(BuildContext context, String message, bool isError) {
    SnackBarApp.showSnackBarApp(
      context: context,
      message: message,
      isError: isError,
    );
  }

  void goToOffer(BuildContext context, OfferModel offer) {
    Navigator.pushNamed(
      context, 
      '/cooperative_offer', 
      arguments: ArgumentsModel(
        offer: offer,
        valueOfEnergyAcount: valueOfEnergyAcount,
      ),
    );
  }
}