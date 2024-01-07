import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/parameter/get_offers_parameter.dart';

abstract interface class IOffersDatasource {
  Future<List<CooperativeEntity>> getOffers(GetOffersParameter parameter);
}
