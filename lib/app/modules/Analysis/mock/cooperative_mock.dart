import 'package:wattio_frontend_desafio_offkevyn/app/shared/util/brazilian_states.dart';

import '../../../shared/enum/property_type.dart';
import '../model/cooperative.dart';

class CooperativeMock {
  final List<State> _states = BrazilianStates.getStateList();

  List<Cooperative> cooperatives(){
    return [
    Cooperative(
      name: 'EnergiaVital S.A.',
      economy: 0.10,
      maxMonthlyAmount: 5000.0,
      minMonthlyAmount: 1000.0,
      states: [_states[0], _states[1], _states[2], _states[3]],
      propertyTypes: [PropertType.house],
    ),
    Cooperative(
      name: 'PotênciaRenovável Ltda.',
      economy: 0.20,
      maxMonthlyAmount: 4500.0,
      minMonthlyAmount: 900.0,
      states: [_states[10], _states[14], _states[2], _states[25]],
      propertyTypes: [PropertType.company, PropertType.house],
    ),
    Cooperative(
      name: 'EcoEnergia Solutions',
      economy: 0.15,
      maxMonthlyAmount: 6000.0,
      minMonthlyAmount: 1200.0,
      states: [_states[0], _states[20], _states[21], _states[22]],
      propertyTypes: [PropertType.house, PropertType.company],
    ),
    Cooperative(
      name: 'LuminarPower Co.',
      economy: 0.50,
      maxMonthlyAmount: 4000.0,
      minMonthlyAmount: 800.0,
      states: [_states[1], _states[5], _states[10], _states[13]],
      propertyTypes: [PropertType.company],
    ),
    Cooperative(
      name: 'GreenGrid Energy',
      economy: 0.30,
      maxMonthlyAmount: 5500.0,
      minMonthlyAmount: 1100.0,
      states: [_states[0], _states[1], _states[2], _states[3]],
      propertyTypes: [PropertType.house],
    ),
    Cooperative(
      name: 'RadiantSource Inc.',
      economy: 0.10,
      maxMonthlyAmount: 10000.0,
      minMonthlyAmount: 5000.0,
      states: [_states[11], _states[16], _states[14], _states[13]],
      propertyTypes: [PropertType.company],
    ),
    Cooperative(
      name: 'ZenithPower Innovations',
      economy: 0.35,
      maxMonthlyAmount: 15000.0,
      minMonthlyAmount: 10000.0,
      states: [_states[10], _states[14], _states[2], _states[25]],
      propertyTypes: [PropertType.company, PropertType.house],
    ),
    Cooperative(
      name: 'EcoFusion Energy Corp.',
      economy: 0.45,
      maxMonthlyAmount: 30000.0,
      minMonthlyAmount: 20000.0,
      states: [_states[0], _states[20], _states[21], _states[22]],
      propertyTypes: [PropertType.house, PropertType.company],
    ),
  ];
  }
}
