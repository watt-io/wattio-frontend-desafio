import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/parameter/get_offers_parameter.dart';
import 'package:wattio_frontend_desafio/modules/offers/infra/datasource/offers_datasource.dart';

final class OffersLocalDatasource implements IOffersDatasource {
  @override
  Future<List<CooperativeEntity>> getOffers(
    GetOffersParameter parameter,
  ) async {
    final response = await rootBundle.loadString(
      'lib/shared/mock_data/cooperative_mock_data.json',
    );
    final data = await json.decode(response);
    final offersMappedList =
        data.map((item) => CooperativeEntity.fromMap(item));

    final offers = List<CooperativeEntity>.from(offersMappedList);

    return offers
        .where(
          (offer) =>
              parameter.value >= offer.minMonthlyAmount &&
              parameter.value <= offer.maxMonthlyAmount,
        )
        .toList();
  }
}
