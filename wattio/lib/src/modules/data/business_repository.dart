

import 'package:wattio/src/modules/model/business_model.dart';

Future<List<BusinessModel>> fetchCooperativesMock() async {
  await Future.delayed(Duration(seconds: 2));

  final data = [
    {
      'name': 'EnerFácil',
      'minMonthlyValue': 1000,
      'maxMonthlyValue': 40000,
      'discount': 0.2,
      'audience': 'both',
    },
    {
      'name': 'EnerLimpa',
      'minMonthlyValue': 10000,
      'maxMonthlyValue': 80000,
      'discount': 0.25,
      'audience': 'both',
    },
    {
      'name': 'EnerGrande',
      'minMonthlyValue': 40000,
      'maxMonthlyValue': 100000,
      'discount': 0.3,
      'audience': 'business',
    },
    {
      'name': 'SolarMais',
      'minMonthlyValue': 500,
      'maxMonthlyValue': 5000,
      'discount': 0.15,
      'audience': 'individual',
    },
    {
      'name': 'LuzVerde',
      'minMonthlyValue': 8000,
      'maxMonthlyValue': 60000,
      'discount': 0.18,
      'audience': 'both',
    },
    {
      'name': 'EcoEnergia',
      'minMonthlyValue': 12000,
      'maxMonthlyValue': 90000,
      'discount': 0.27,
      'audience': 'business',
    },
    {
      'name': 'SolBarato',
      'minMonthlyValue': 700,
      'maxMonthlyValue': 7000,
      'discount': 0.1,
      'audience': 'individual',
    },
    {
      'name': 'NovaEnergia',
      'minMonthlyValue': 3000,
      'maxMonthlyValue': 25000,
      'discount': 0.2,
      'audience': 'both',
    },
    {
      'name': 'PotentiaSolar',
      'minMonthlyValue': 50000,
      'maxMonthlyValue': 200000,
      'discount': 0.35,
      'audience': 'business',
    },
    {
      'name': 'ClaraLuz',
      'minMonthlyValue': 1000,
      'maxMonthlyValue': 15000,
      'discount': 0.12,
      'audience': 'individual',
    },
  ];

  return data.map((e) => BusinessModel.fromMap(e)).toList();
}
