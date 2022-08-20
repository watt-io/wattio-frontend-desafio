import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';
import '../repository/home_repository.dart';
import 'offer_list_events.dart';
import 'offer_list_state.dart';

class HomeBloc extends Bloc<OfferListEvents, OfferListState> {

  final HomeRepository _homeRepository = HomeRepository();

  final TextEditingController valueController = TextEditingController();

  double valueOfEnergyAcount = 0.0;

  final currencyFormatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    name: 'R\$',
  );

  HomeBloc() : super(OfferListStateInitial()) {
    on<OfferListInitialEvent>(
      (event, emit) => emit(OfferListStateInitial()),
    );

    on<OfferListLoadingEvent>(
      (event, emit) async {
        emit(OfferListStateLoading());
        try {
          final offers = await _homeRepository.getOffers();
          if (offers.isEmpty 
          || filterOffers(valueOfEnergyAcount, offers).isEmpty) {
            emit(OfferListStateEmpty());
          } else {
            emit(OfferListStateLoaded(
                offers: filterOffers(valueOfEnergyAcount, offers)));
          }
        } on AppError catch (e) {
          if (e == AppError.timeout) {
            log(e.toString());
            emit(OfferListStateError(
              'Verifique sua conexão com a internet',
            ));
          } else {
            log(e.toString());
            emit(OfferListStateError(
              'Houve um erro na comunicação com o servidor'
            ));
          }
        } catch (e) {
          log(e.toString());
          emit(OfferListStateError('Ops, algo deu errado'));
        }
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
      backgroundColor: Theme.of(
        context
      ).colorScheme.onBackground.withAlpha(200),
      isError: false,
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

  List<OfferModel> filterOffers(
    double valueOfEnergyAcount,
    List<OfferModel> offers,
  ) => offers.where((offer) => 
      offer.minimumMonthlyAmount <= valueOfEnergyAcount
      && offer.maximumMonthlyAmount >= valueOfEnergyAcount
  ).toList();
}