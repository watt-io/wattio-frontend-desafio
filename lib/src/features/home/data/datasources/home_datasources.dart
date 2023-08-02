import 'package:frontend_wattio/src/core/architecture/usecase.dart';
import 'package:frontend_wattio/src/features/home/data/models/offer_model.dart';

abstract class HomeDataSources {
  Future<List<OfferModel>> calculateOffers(CalculateOffersParams params);
}
