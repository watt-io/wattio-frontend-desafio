// ignore_for_file: unnecessary_lambdas

import '../../../app.dart';

class HomeRepository {
  final HttpClient httpClient = HttpClientImp();

  Future<List<OfferModel>> getOffers() async {
    final Response response = await httpClient.get('/cooperative-offers');

    if (!response.isOk || response.body == null) throw AppError.api;
    
    return (response.body?['items'] as List)
        .map((item) => OfferModel.fromJson(item))
        .toList();
  }
}