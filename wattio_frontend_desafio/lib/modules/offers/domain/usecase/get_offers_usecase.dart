import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/exception/offers_exception.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/parameter/get_offers_parameter.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/repository/offers_repository.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/usecase/usecase.dart';

final class GetOffersUsecase implements IUsecase<List<CooperativeEntity>?, OffersException?, GetOffersParameter> {
  final IOffersRepository _repository;

  GetOffersUsecase(this._repository);

  @override
  Future<(List<CooperativeEntity>?, OffersException?)> call(
    GetOffersParameter param,
  ) async {
    return await _repository.getOffers(param);
  }
}
