import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/exception/offers_exception.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/parameter/get_offers_parameter.dart';

abstract interface class IOffersRepository {
  Future<(List<CooperativeEntity>? success, OffersException? failure)> getOffers(
    GetOffersParameter parameter,
  );
}
