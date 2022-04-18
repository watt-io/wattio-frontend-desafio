import 'package:wattio_front/energy_cooperative/energy_cooperative_entity.dart';

class JsonToEnergyCooperative {
  static EnergyCooperative fromMap(dynamic json) {
    return EnergyCooperative(
      name: json['name'],
      minMonthlyValue: json['minMonthlyValue'],
      maxMonthlyValue: json['maxMonthlyValue'],
      discount: json['discount'],
      personType: PersonType.values.firstWhere(
        (e) => e.name == json['personType'],
      ),
    );
  }
}
