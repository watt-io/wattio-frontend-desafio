import '../../../app.dart';

abstract class OfferListState {
  List<OfferModel> offerList;
  String? error;

  OfferListState({
    this.offerList = const [],
    this.error,
  });
}

class OfferListStateInitial extends OfferListState {
  OfferListStateInitial()
      : super(
        offerList: [],
      );
}

class OfferListStateLoading extends OfferListState {
  OfferListStateLoading()
      : super(
        offerList: [],
      );
}

class OfferListStateEmpty extends OfferListState {
  OfferListStateEmpty()
      : super(
        offerList: [],
      );
}

class OfferListStateLoaded extends OfferListState {
  final List<OfferModel> offers;
  OfferListStateLoaded({this.offers = const []})
      : super(
        offerList: offers,
      );
}

class OfferListStateError extends OfferListState {
  OfferListStateError(
    this.errorText,
  )
      : super(
        offerList: [],
        error: errorText,
      );
  
  String? errorText;
}