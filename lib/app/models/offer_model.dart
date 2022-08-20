class OfferModel {
  final String title;
  final double minimumMonthlyAmount;
  final double maximumMonthlyAmount;
  final double savingsPercentage;
  final bool onlyForCompanies;

  int? id;

  OfferModel({
    required this.title,
    required this.minimumMonthlyAmount,
    required this.maximumMonthlyAmount,
    required this.savingsPercentage,
    required this.onlyForCompanies,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
      title: json['title'] as String,
      minimumMonthlyAmount: json['minimumMonthlyAmount'] as double,
      maximumMonthlyAmount: json['maximumMonthlyAmount'] as double,
      savingsPercentage: json['savingsPercentage'] as double,
      onlyForCompanies: json['onlyForCompanies'] as bool
    );

  Map<String, dynamic> toJson() => {
      'title': title,
      'minimumMonthlyAmount': minimumMonthlyAmount,
      'maximumMonthlyAmount': maximumMonthlyAmount,
      'savingsPercentage': savingsPercentage,
      'onlyForCompanies': onlyForCompanies,
    };
}