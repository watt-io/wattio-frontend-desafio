import 'package:wattio_front/energy_cooperative/adapters/json_to_energy_cooperative.dart';
import 'package:wattio_front/energy_cooperative/energy_cooperative_entity.dart';

class EnergyCooperativesDatasource {
  static final _localData = [
    {
      'name': 'Easy Energy',
      'minMonthlyValue': 1000,
      'maxMonthlyValue': 40000,
      'discount': 0.2,
      'personType': 'human',
    },
    {
      'name': 'Pequeno Comércio',
      'minMonthlyValue': 5000,
      'maxMonthlyValue': 28000,
      'discount': 0.22,
      'personType': 'nonHuman',
    },
    {
      'name': 'Clean Energy',
      'minMonthlyValue': 10000,
      'maxMonthlyValue': 80000,
      'discount': 0.25,
      'personType': 'human',
    },
    {
      'name': 'Energy for Coorps',
      'minMonthlyValue': 15000,
      'maxMonthlyValue': 95000,
      'discount': 0.15,
      'personType': 'nonHuman',
    },
    {
      'name': 'EnerGrande',
      'minMonthlyValue': 40000,
      'maxMonthlyValue': 100000,
      'discount': 0.3,
      'personType': 'human',
    },
  ];

  static List<EnergyCooperative> getLocalData() {
    final data = _localData
        .map(
          (e) => JsonToEnergyCooperative.fromMap(e),
        )
        .toList();

    return data;
  }
}
