import '../models/models.dart';

abstract class OfferListEvents {}

class OfferListLoadedEvent extends OfferListEvents {
  final List<OfferModel> offers;
  OfferListLoadedEvent({this.offers = const []});
}

class OfferListLoadingEvent extends OfferListEvents {}

class OfferListInitialEvent extends OfferListEvents {}

class OfferListEmptyEvent extends OfferListEvents {}