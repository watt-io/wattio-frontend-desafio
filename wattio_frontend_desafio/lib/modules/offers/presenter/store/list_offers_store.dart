import 'package:flutter/foundation.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/parameter/get_offers_parameter.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/usecase/get_offers_usecase.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/state/list_offers_state.dart';

class ListOffersStore extends ValueNotifier<LitsOffersState> {
  ListOffersStore(this.usecase) : super(LitsOffersState.initial());

  final GetOffersUsecase usecase;

  Future<void> getOffers(int averageBillAmount) async {
    value = LitsOffersState.loading();

    final param = GetOffersParameter(value: averageBillAmount);
    final (success, failure) = await usecase(param);

    if (failure != null) {
      value = LitsOffersState.failure(failure);
      return;
    }

    if (success!.isEmpty) {
      value = LitsOffersState.emptyList();
      return;
    }

    value = LitsOffersState.success(success);
  }
}
