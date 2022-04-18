enum PersonType { human, nonHuman }

class EnergyCooperative {
  String name;
  int minMonthlyValue;
  int maxMonthlyValue;
  double discount;
  PersonType personType;

  EnergyCooperative({
    required this.name,
    required this.minMonthlyValue,
    required this.maxMonthlyValue,
    required this.discount,
    required this.personType,
  });
}
