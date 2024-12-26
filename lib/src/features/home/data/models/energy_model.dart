class EnergyModel {
  final String name;
  final int valorMinMonth;
  final int valorMaxMonth;
  final int discount;

  EnergyModel(
      {required this.name,
      required this.valorMinMonth,
      required this.valorMaxMonth,
      required this.discount});

  factory EnergyModel.fromMap(dynamic map) {
    return EnergyModel(
        name: map['nome'],
        valorMinMonth: map['valorMinimoMensal'],
        valorMaxMonth: map['valorMaximoMensal'],
        discount: map['desconto']);
  }

  toMap(EnergyModel model) {
    return {
      'nome': model.name,
      'desconto': model.discount,
      'valorMinimoMensal': model.valorMinMonth,
      'valorMaximoMensal': model.valorMaxMonth,
    };
  }

  calculateDiscount(double value) {
    return value * (discount / 100);
  }
}
