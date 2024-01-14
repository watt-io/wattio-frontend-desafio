class CompanyModel {
  String name;
  double minimumValueMonth;
  double maximumValueMonth;
  double discount;
  String formOfHiring;
  String contractPlan;
  double assessments;
  int paymentTerm;

  CompanyModel({
    required this.name,
    required this.minimumValueMonth,
    required this.maximumValueMonth,
    required this.discount,
    required this.formOfHiring,
    required this.contractPlan,
    required this.assessments,
    required this.paymentTerm,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      minimumValueMonth: json['minimum_value_month'],
      maximumValueMonth: json['maximum_value_month'],
      discount: json['discount'],
      formOfHiring: json['form_of_hiring'],
      contractPlan: json['contract_plan'],
      assessments: json['assessments'],
      paymentTerm: json['payment_term'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'minimum_value_month': minimumValueMonth,
      'maximum_value_month': maximumValueMonth,
      'discount': discount,
      'form_of_hiring': formOfHiring,
      'contract_plan': contractPlan,
      'assessments': assessments,
      'payment_term': paymentTerm,
    };
  }
}
