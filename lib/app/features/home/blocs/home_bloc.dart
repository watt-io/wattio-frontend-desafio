import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';
import '../repository/repository.dart';
import 'blocs.dart';

class HomeBloc extends Bloc<OfferListEvents, OfferListState> {

  final HomeRepository repository;

  final TextEditingController valueController = TextEditingController();

  double valueOfEnergyAcount = 0.0;

  bool stateEmptySnackbarDisplayed = false;

  final currencyFormatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    name: 'R\$',
  );

  HomeBloc({required this.repository}) : super(OfferListStateInitial()) {
    on<OfferListEventInitial>(
      (event, emit) => emit(OfferListStateInitial()),
    );

    on<OfferListEventLoading>(
      (event, emit) async {
        emit(OfferListStateLoading());
        try {
          final offers = await repository.getOffers();
          
          if (offers.isEmpty 
              || filterOffers(valueOfEnergyAcount, offers).isEmpty) {
            
            stateEmptySnackbarDisplayed = false;
            emit(OfferListStateEmpty());

          } else {
            emit(OfferListStateLoaded(
                offers: filterOffers(valueOfEnergyAcount, offers)));
          }
        } on AppError catch (e) {
          if (e == AppError.timeout) {
            emit(OfferListStateError(
              'Verifique sua conexão com a internet',
            ));
          } else {
            emit(OfferListStateError(
              'Houve um erro na comunicação com o servidor'
            ));
          }
        } catch (e) {
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

  void decreaseValue(int value, BuildContext context) {
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