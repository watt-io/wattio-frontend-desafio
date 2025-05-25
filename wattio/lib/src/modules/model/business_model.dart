import 'package:wattio/src/modules/model/audience_type.dart';

class BusinessModel {
  final String name;
  final int minMonthlyValue;
  final int maxMonthlyValue;
  final double discount;
  final AudienceType audienceType;

  BusinessModel({
    required this.name,
    required this.minMonthlyValue,
    required this.maxMonthlyValue,
    required this.discount,
    required this.audienceType,
  });

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      name: map['name'],
      minMonthlyValue: map['minMonthlyValue'],
      maxMonthlyValue: map['maxMonthlyValue'],
      discount: map['discount'],
      audienceType: parseAudienceType(map['audience']),
    );
  }
}