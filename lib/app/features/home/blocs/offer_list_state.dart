import '../../../core/utils/default_values.dart';
import '../models/models.dart';

abstract class OfferListState {
  List<OfferModel> offerList;
  OfferListStateEnum state;

  OfferListState({
    this.offerList = const [],
    this.state = OfferListStateEnum.initial,
  });
}

class OfferListStateInitial extends OfferListState {
  OfferListStateInitial()
      : super(
        offerList: [],
        state: OfferListStateEnum.initial,
      );
}

class OfferListStateLoading extends OfferListState {
  OfferListStateLoading()
      : super(
        offerList: [],
        state: OfferListStateEnum.loading,
      );
}

class OfferListStateEmpty extends OfferListState {
  OfferListStateEmpty()
      : super(
        offerList: [],
        state: OfferListStateEnum.empty,
      );
}

class OfferListStateLoaded extends OfferListState {
  final List<OfferModel> offers;
  OfferListStateLoaded({this.offers = const []})
      : super(
        offerList: offers,
        state: OfferListStateEnum.loaded,
      );
}