import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../models/models.dart';
import '../repository/home_repository.dart';
import 'offer_list_events.dart';
import 'offer_list_state.dart';

class OfferListBloc extends Bloc<OfferListEvents, OfferListState> {
  final HomeRepository _homeRepository = HomeRepository();
  
  OfferListBloc() : super(OfferListStateInitial()) {
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
}