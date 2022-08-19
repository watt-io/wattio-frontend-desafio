import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import '../models/models.dart';
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
          final List<OfferModel> offers = await _homeRepository.getOffers();
          if (offers.isEmpty) {
            emit(OfferListStateEmpty());
          } else {
            emit(OfferListStateLoaded(offers: offers));
          }
        } catch (e) {
          emit(OfferListStateError('Houve um erro: $e'));
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

  void buildSnackBar(BuildContext context, String message) {
    SnackBarApp.showSnackBarApp(
      context, message, true
    );
  }
}