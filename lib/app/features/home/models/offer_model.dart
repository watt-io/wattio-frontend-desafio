class OfferModel {
  final String title;
  final double minimumMonthlyAmount;
  final double maximumMonthlyAmount;

  OfferModel({
    required this.title,
    required this.minimumMonthlyAmount,
    required this.maximumMonthlyAmount,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
      title: json['title'] as String,
      minimumMonthlyAmount: json['minimumMonthlyAmount'] as double,
      maximumMonthlyAmount: json['maximumMonthlyAmount'] as double,
    );

  Map<String, dynamic> toJson() => {
      'title': title,
      'minimumMonthlyAmount': minimumMonthlyAmount,
      'maximumMonthlyAmount': maximumMonthlyAmount,
    };
}