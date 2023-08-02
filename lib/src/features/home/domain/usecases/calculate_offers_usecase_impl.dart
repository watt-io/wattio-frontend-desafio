import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class CalculateOffersUseCaseImpl
    implements UseCase<CalculateOffersParams, List<OfferModel>> {
  HomeRepository repository;

  CalculateOffersUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<OfferModel>>> call(CalculateOffersParams input) {
    return repository.calculateOffers(input);
  }
}
