import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/exception/offers_exception.dart';

sealed class LitsOffersState {
  LitsOffersState();

  factory LitsOffersState.initial() {
    return ListOffersInitialState();
  }

  factory LitsOffersState.loading() {
    return ListOffersLoadingState();
  }

  factory LitsOffersState.emptyList() {
    return ListOffersEmptyListState();
  }

  factory LitsOffersState.success(List<CooperativeEntity> offers) {
    return ListOffersSuccessState(offers: offers);
  }

  factory LitsOffersState.failure(OffersException exception) {
    return ListOffersFailureState(exception: exception);
  }
}

final class ListOffersInitialState extends LitsOffersState {}

final class ListOffersLoadingState extends LitsOffersState {}

final class ListOffersEmptyListState extends LitsOffersState {}

final class ListOffersSuccessState extends LitsOffersState {
  final List<CooperativeEntity> offers;

  ListOffersSuccessState({required this.offers});
}

final class ListOffersFailureState extends LitsOffersState {
  final OffersException exception;

  ListOffersFailureState({required this.exception});
}
