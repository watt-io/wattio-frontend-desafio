import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class HomeStableData {
  final List<OfferModel> listOffer;
  final EconomyEntity? economyModel;

  HomeStableData({required this.listOffer, required this.economyModel});
}

class HomeBloc extends Bloc {
  CalculateOffersUseCaseImpl calculateOffersUseCaseImpl;
  CalculateEconomyUseCaseImpl calculateEconomyUseCaseImpl;
  HomeBloc(this.calculateOffersUseCaseImpl, this.calculateEconomyUseCaseImpl);

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventOnReady) {
      _handleOnReady();
    } else if (event is HomeEventCalculateOffer) {
      _handleCalculateOffer(event.value, event.context);
    } else if (event is HomeEventCalculateEconomy) {
      _handleCalculateEconomy(event.model);
    }
  }

  _handleCalculateOffer(double value, BuildContext context) async {
    final result = await calculateOffersUseCaseImpl
        .call(CalculateOffersParams(value: value));

    result.fold((l) {
      dispatchState(BlocErrorState(l.message));
    }, (r) {
      if (r.isEmpty) {
        showSnack(context, 'Insira o valor minimo de R\$ 1.000,00', null);
      } else {
        dispatchState(BlocStableState(
            data: HomeStableData(listOffer: r, economyModel: null)));
      }
    });
  }

  _handleOnReady() {
    dispatchState(BlocStableState(
        data: HomeStableData(listOffer: <OfferModel>[], economyModel: null)));
  }

  _handleCalculateEconomy(OfferModel model) async {
    final entity = await calculateEconomyUseCaseImpl
        .call(CalculateEconomyParams(model: model));

    dispatchState(BlocStableState(
        data: HomeStableData(listOffer: [], economyModel: entity)));
  }
}
