import 'dart:async';

import '../models/models.dart';
import '../repository/home_repository.dart';
import 'offer_list_events.dart';
import 'offer_list_state.dart';

class OfferListBloc {
  final HomeRepository _homeRepository = HomeRepository();

  final StreamController<OfferListEvents> _inputOfferListController =
      StreamController<OfferListEvents>.broadcast();
  
  final StreamController<OfferListState> _outputOfferListController =
      StreamController<OfferListState>.broadcast();
  
  Sink<OfferListEvents> get inputOfferList =>
      _inputOfferListController.sink;
  Stream<OfferListState> get stream => 
      _outputOfferListController.stream;
  
  OfferListBloc() {
    _inputOfferListController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(OfferListEvents event) async {
    final List<OfferModel> offers;
    if (event is OfferListInitialEvent) {
      _outputOfferListController.add(OfferListStateInitial());
    }
    else if (event is OfferListLoadingEvent) {
      _outputOfferListController.add(OfferListStateLoading());
      offers = await _homeRepository.getOffers();
      if (offers.isEmpty) {
        _outputOfferListController.add(OfferListStateEmpty());
      }
      else {
        _outputOfferListController.add(OfferListStateLoaded(offers: offers));
      }
    }
  }
}