import 'package:frontend_wattio/src/core/architecture/usecase.dart';
import 'package:frontend_wattio/src/features/home/data/datasources/home_datasources.dart';
import 'package:frontend_wattio/src/features/home/data/models/energy_model.dart';
import 'package:frontend_wattio/src/features/home/data/models/offer_model.dart';

class HomeDataSourcesRemoteImpl implements HomeDataSources {
  List<Map> listMockedMaps = [
    {
      'nome': 'EnerFácil',
      'valorMinimoMensal': 1000,
      'valorMaximoMensal': 40000,
      'desconto': 20,
    },
    {
      'nome': 'EnerLimpa',
      'valorMinimoMensal': 10000,
      'valorMaximoMensal': 80000,
      'desconto': 25,
    },
    {
      'nome': 'EnerGrande',
      'valorMinimoMensal': 40000,
      'valorMaximoMensal': 100000,
      'desconto': 30,
    }
  ];
  @override
  Future<List<OfferModel>> calculateOffers(CalculateOffersParams params) async {
    final value = params.value;

    final List<EnergyModel> listEnergy =
        listMockedMaps.map((e) => EnergyModel.fromMap(e)).toList();

    final listOffers = listEnergy
        .where((energy) =>
            value >= energy.valorMinMonth && value <= energy.valorMaxMonth)
        .map((energy) => OfferModel(
              name: energy.name,
              discount: energy.discount.toDouble(),
              discountedValue: energy.calculateDiscount(value),
            ))
        .toList();

    return listOffers;
  }
}
