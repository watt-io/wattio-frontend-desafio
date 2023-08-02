import 'package:dartz/dartz.dart';
import 'package:frontend_wattio/src/core/failure/failure.dart';
import 'package:frontend_wattio/src/features/home/data/models/offer_model.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}

class CalculateOffersParams {
  final double value;

  CalculateOffersParams({required this.value});
}

class CalculateEconomyParams {
  final OfferModel model;

  CalculateEconomyParams({required this.model});
}
