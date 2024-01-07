import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/exception/offers_exception.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/parameter/get_offers_parameter.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/repository/offers_repository.dart';
import 'package:wattio_frontend_desafio/modules/offers/infra/datasource/offers_datasource.dart';

final class OffersLocalRepository implements IOffersRepository {
  final IOffersDatasource _datasource;

  OffersLocalRepository(this._datasource);

  @override
  Future<(List<CooperativeEntity>?, OffersException?)> getOffers(
    GetOffersParameter parameter,
  ) async {
    try {
      return (await _datasource.getOffers(parameter), null);
    } catch (e, s) {
      return (null, OffersException.unknow(s, e));
    }
  }
}
