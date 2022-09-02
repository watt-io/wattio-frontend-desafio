class OfferModel {
  final String title;
  final double minimumMonthlyAmount;
  final double maximumMonthlyAmount;
  final double savingsPercentage;

  int? id;

  OfferModel({
    required this.title,
    required this.minimumMonthlyAmount,
    required this.maximumMonthlyAmount,
    required this.savingsPercentage,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
      title: json['cooperative'] as String,
      minimumMonthlyAmount: (json['minimumMonthlyAmount'] as int).toDouble(),
      maximumMonthlyAmount: (json['maximumMonthlyAmount'] as int).toDouble(),
      savingsPercentage: json['savingsPercentage'] as double,
    );

  Map<String, dynamic> toJson() => {
      'cooperative': title,
      'minimumMonthlyAmount': minimumMonthlyAmount,
      'maximumMonthlyAmount': maximumMonthlyAmount,
      'savingsPercentage': savingsPercentage
    };
}