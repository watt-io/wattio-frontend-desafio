import 'package:wattio/src/modules/data/business_repository.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/modules/model/business_model.dart';

Future<List<BusinessModel>> findBusiness({
  required AudienceType userType,
  required int monthlySpend,
}) async {
  final allBusiness = await fetchCooperativesMock();

  return allBusiness.where((business) {
    final audienceType = business.audienceType == userType || business.audienceType == AudienceType.both;
    final withinValue = monthlySpend >= business.minMonthlyValue;
    return audienceType && withinValue;
  }).toList();
}

