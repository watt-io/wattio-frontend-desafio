import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/modules/controller/business_controller.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/modules/model/business_model.dart';

// Mock da função fetchEmpresasMock
Future<List<BusinessModel>> fetchCooperativesMockTest() async {
  return [
    BusinessModel(
      name: 'Empresa A',
      minMonthlyValue: 100,
      maxMonthlyValue: 500,
      discount: 10.0,
      audienceType: AudienceType.pf,
    ),
    BusinessModel(
      name: 'Empresa B',
      minMonthlyValue: 250,
      maxMonthlyValue: 800,
      discount: 15.0,
      audienceType: AudienceType.pj,
    ),
    BusinessModel(
      name: 'Empresa C',
      minMonthlyValue: 300,
      maxMonthlyValue: 1000,
      discount: 20.0,
      audienceType: AudienceType.both,
    ),
  ];
}

Future<List<BusinessModel>> findBusiness({
  required AudienceType userType,
  required int monthlySpend,
}) async {
  final allBusiness = await fetchCooperativesMockTest();

  return allBusiness.where((business) {
    final audienceType = business.audienceType == userType || business.audienceType == AudienceType.both;
    final withinValue = monthlySpend >= business.minMonthlyValue;
    return audienceType && withinValue;
  }).toList();
}



//Para testar o mock, deve-se trazer a função findBusiness para essa tela


void main() {
  test('Retorna empresas compatíveis com tipo individual e gasto de 250', () async {
    final result = await findBusiness(
      userType: AudienceType.pf,
      monthlySpend: 300,
    );

    expect(result.length, 2);
    expect(result.any((b) => b.name == 'Empresa A'), isTrue);
    expect(result.any((b) => b.name == 'Empresa C'), isTrue);
  });

  test('Retorna apenas Empresa C para tipo company e gasto de 350', () async {
    final result = await findBusiness(
      userType: AudienceType.pj,
      monthlySpend: 350,
    );

    expect(result.length, 2);
    expect(result.any((b) => b.name == 'Empresa B'), isTrue);
    expect(result.any((b) => b.name == 'Empresa C'), isTrue);
  });

  test('Retorna vazio para tipo company com gasto insuficiente', () async {
    final result = await findBusiness(
      userType: AudienceType.pj,
      monthlySpend: 100,
    );

    expect(result, isEmpty);
  });
}
