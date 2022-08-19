import '../models/models.dart';

class HomeRepository {
  Future<List<OfferModel>> getOffers() async {
    final List<OfferModel> offers = [];
    for (var i = 0; i < 10; i++) {
      offers.add(OfferModel(
        title: 'Cooperativa de Energia $i',
        minimumMonthlyAmount: i * 10,
        maximumMonthlyAmount: i * 10 + 10,
      ));
    }
    await Future.delayed(const Duration(seconds: 2));
    return offers;
  }
}