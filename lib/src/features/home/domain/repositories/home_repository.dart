import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../home.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<OfferModel>>> calculateOffers(
      CalculateOffersParams params);
  EconomyEntity calculateEconomy(CalculateEconomyParams params);
}
