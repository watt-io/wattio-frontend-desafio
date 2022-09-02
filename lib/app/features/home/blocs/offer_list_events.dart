import '../../../app.dart';

abstract class OfferListEvents {}

class OfferListLoadedEvent extends OfferListEvents {
  final List<OfferModel> offers;
  String? error;
  OfferListLoadedEvent({this.offers = const []});
}

class OfferListEventLoading extends OfferListEvents {}

class OfferListEventInitial extends OfferListEvents {}

class OfferListEventEmpty extends OfferListEvents {}

class OfferListEventError extends OfferListEvents {}