class CooperativeEntity {
  final int id;
  final String name;
  final double discount;
  final int minMonthlyAmount;
  final int maxMonthlyAmount;

  CooperativeEntity({
    required this.id,
    required this.name,
    required this.discount,
    required this.minMonthlyAmount,
    required this.maxMonthlyAmount,
  });

  factory CooperativeEntity.fromMap(Map<String, dynamic> map) {
    return CooperativeEntity(
      id: map['id'],
      name: map['name'],
      discount: map['discount'],
      minMonthlyAmount: map['minMonthlyAmount'],
      maxMonthlyAmount: map['maxMonthlyAmount'],
    );
  }

}
