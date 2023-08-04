import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, List<OfferModel>>> calculateOffers(
      CalculateOffersParams params) async {
    try {
      return Right(await dataSources.calculateOffers(params));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  EconomyEntity calculateEconomy(CalculateEconomyParams params) {
    final EconomyEntity entity = EconomyEntity(
        economyMonth: params.model.discountedValue / 12,
        economyYear: params.model.discountedValue);

    return entity;
  }
}
