import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements dio.Dio {}

void main() {

  final DioMock client = DioMock();

  client.options = dio.BaseOptions(
        baseUrl: apiDomain + apiBasePath,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiToken',
        },
      );
  
  final HttpClient httpClient = HttpClientImp(client: client);

  group('httpClient |', () {
    test('Should get a Response', () async {

    when(() => client.get(apiEndpoint))
        .thenAnswer((invocation) async => dio.Response(
            statusCode: 200,
            data: mockJson,
            requestOptions: dio.RequestOptions(path: '')
          ));
    
    final ResponseModel response = await httpClient.get(apiEndpoint);

    expect(response.isOk, equals(true));
    expect(response.body, allOf([
      isA<Map<String, dynamic>>(),
      isNotEmpty
    ]));
  });

  test('Should return a AppError.timeout', () async {
    when(() => client.get(apiEndpoint))
        .thenAnswer((_) => throw AppError.timeout);

    expect(
      () => httpClient.get(apiEndpoint), 
      throwsA(equals(AppError.timeout))
    );
  });

  test('Should return a AppError.api', () async {
    when(() => client.get(apiEndpoint))
        .thenAnswer((_) => throw AppError.api);

    expect(
      () => httpClient.get(apiEndpoint), 
      throwsA(equals(AppError.api))
    );
  });
  });
  
}


Map<String, dynamic> mockJson = {
    'cursor': null,
    'items': [
        {
            '_created': 1660975902.009136,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975902.009144,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/d75207fd-858c-47b0-95a5-48f9f3cd285d',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'd75207fd-858c-47b0-95a5-48f9f3cd285d',
            'cooperative': 'EnerFácil',
            'maximumMonthlyAmount': 4000,
            'minimumMonthlyAmount': 1000,
            'savingsPercentage': 0.2
        },
        {
            '_created': 1660975901.997493,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.9975,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/c8a8ab3a-d491-43e9-bf41-e93bceaa085e',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'c8a8ab3a-d491-43e9-bf41-e93bceaa085e',
            'cooperative': 'EnerLimpa',
            'maximumMonthlyAmount': 4000,
            'minimumMonthlyAmount': 2000,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.981782,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.98179,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/b38c3545-80a5-4b1a-bab6-e89f4f545877',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'b38c3545-80a5-4b1a-bab6-e89f4f545877',
            'cooperative': 'EnerGrande',
            'maximumMonthlyAmount': 500,
            'minimumMonthlyAmount': 100,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.966067,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.966074,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/36b78df4-5f86-4531-8ef4-387dfce74ff3',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '36b78df4-5f86-4531-8ef4-387dfce74ff3',
            'cooperative': 'CoopEnergia',
            'maximumMonthlyAmount': 5000,
            'minimumMonthlyAmount': 300,
            'savingsPercentage': 0.2
        },
        {
            '_created': 1660975901.956084,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.956092,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/83d74082-bf95-4713-a95b-eb848ca9928d',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '83d74082-bf95-4713-a95b-eb848ca9928d',
            'cooperative': 'EnerEco',
            'maximumMonthlyAmount': 6000,
            'minimumMonthlyAmount': 2000,
            'savingsPercentage': 0.4
        },
        {
            '_created': 1660975901.935296,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.935304,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/03d10825-1ed9-40dc-9114-c5f290c9f1ab',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '03d10825-1ed9-40dc-9114-c5f290c9f1ab',
            'cooperative': 'Eletro Limpa',
            'maximumMonthlyAmount': 350,
            'minimumMonthlyAmount': 50,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.919392,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.9194,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/a8d06584-c1fe-4bcd-a75b-0a56890882f2',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'a8d06584-c1fe-4bcd-a75b-0a56890882f2',
            'cooperative': 'Eletro Nós Lmtd',
            'maximumMonthlyAmount': 5000,
            'minimumMonthlyAmount': 1000,
            'savingsPercentage': 0.15
        },
        {
            '_created': 1660975901.885697,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.885703,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/87e2028a-e7a8-4d8d-952e-58a30243f8f9',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '87e2028a-e7a8-4d8d-952e-58a30243f8f9',
            'cooperative': 'Cooperativa Eletro',
            'maximumMonthlyAmount': 600,
            'minimumMonthlyAmount': 200,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.873594,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.873601,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/60e5d8ca-6794-485e-9180-0f345d48c207',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '60e5d8ca-6794-485e-9180-0f345d48c207',
            'cooperative': 'Eletro Ecológica',
            'maximumMonthlyAmount': 7000,
            'minimumMonthlyAmount': 3000,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.862031,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.862038,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/43094212-a323-45dc-8a75-14a276cfb719',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '43094212-a323-45dc-8a75-14a276cfb719',
            'cooperative': 'Coop Watts',
            'maximumMonthlyAmount': 350,
            'minimumMonthlyAmount': 50,
            'savingsPercentage': 0.15
        },
        {
            '_created': 1660975901.845505,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.845511,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/96f68e4e-b400-4fd0-8950-f0c3e62ce70c',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '96f68e4e-b400-4fd0-8950-f0c3e62ce70c',
            'cooperative': 'Eletro Grande Cooperativa',
            'maximumMonthlyAmount': 500,
            'minimumMonthlyAmount': 100,
            'savingsPercentage': 0.28
        },
        {
            '_created': 1660975901.828623,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.82863,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/217c02a9-0075-4172-8e03-f5a56b713205',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '217c02a9-0075-4172-8e03-f5a56b713205',
            'cooperative': 'Cooperativa Bem Energia',
            'maximumMonthlyAmount': 600,
            'minimumMonthlyAmount': 200,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.79628,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.796287,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/77ef0f0a-41dd-44c9-8d4e-02e911a6932a',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '77ef0f0a-41dd-44c9-8d4e-02e911a6932a',
            'cooperative': 'Eletro Ecolimpeza',
            'maximumMonthlyAmount': 7000,
            'minimumMonthlyAmount': 3000,
            'savingsPercentage': 0.37
        },
        {
            '_created': 1660975901.776699,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.776706,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/6cfc0af6-04e8-4789-b40c-865e27560454',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '6cfc0af6-04e8-4789-b40c-865e27560454',
            'cooperative': 'Cooperativa UsiNorte',
            'maximumMonthlyAmount': 350,
            'minimumMonthlyAmount': 50,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.765335,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.765342,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/a888a7e5-b4b7-4c0b-8647-083bcf292efe',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'a888a7e5-b4b7-4c0b-8647-083bcf292efe',
            'cooperative': 'Eletro Bela',
            'maximumMonthlyAmount': 5000,
            'minimumMonthlyAmount': 1000,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.746363,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.74637,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/dce6f97f-1e72-4e00-8ff0-5f349e795bd0',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'dce6f97f-1e72-4e00-8ff0-5f349e795bd0',
            'cooperative': 'Cooperativa Santo Antonio',
            'maximumMonthlyAmount': 600,
            'minimumMonthlyAmount': 200,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.724934,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.724941,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/45f3fef5-76ad-43ac-a43f-40915d85e633',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '45f3fef5-76ad-43ac-a43f-40915d85e633',
            'cooperative': 'Eletro Energia Sul',
            'maximumMonthlyAmount': 700,
            'minimumMonthlyAmount': 300,
            'savingsPercentage': 0.4
        },
        {
            '_created': 1660975901.713331,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.713338,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/6901be40-d956-4241-bdac-aade9035f3e1',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '6901be40-d956-4241-bdac-aade9035f3e1',
            'cooperative': 'Sustentável Cooperativa',
            'maximumMonthlyAmount': 350,
            'minimumMonthlyAmount': 50,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.694352,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.69436,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/52952164-1842-4751-bb06-779750757d1c',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '52952164-1842-4751-bb06-779750757d1c',
            'cooperative': 'Eletro Amazonia',
            'maximumMonthlyAmount': 500,
            'minimumMonthlyAmount': 100,
            'savingsPercentage': 0.35
        },
        {
            '_created': 1660975901.672451,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.672458,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/3e1cb1df-59c1-435d-a3d2-010e742e96c6',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '3e1cb1df-59c1-435d-a3d2-010e742e96c6',
            'cooperative': 'Cooperativa Dois Irmãos',
            'maximumMonthlyAmount': 600,
            'minimumMonthlyAmount': 200,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.662852,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.662859,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/262306c7-7340-4327-86f4-084d92e079cc',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '262306c7-7340-4327-86f4-084d92e079cc',
            'cooperative': 'Sua Luz Cooperativa de Energia',
            'maximumMonthlyAmount': 700,
            'minimumMonthlyAmount': 300,
            'savingsPercentage': 0.4
        },
        {
            '_created': 1660975901.649134,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.649142,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/cf819bd4-44aa-4f5f-b2f6-e03ecadc4f9a',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'cf819bd4-44aa-4f5f-b2f6-e03ecadc4f9a',
            'cooperative': 'Coop Energy',
            'maximumMonthlyAmount': 350,
            'minimumMonthlyAmount': 50,
            'savingsPercentage': 0.35
        },
        {
            '_created': 1660975901.625057,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.625065,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/66e1dace-106a-478b-bf82-9f85ce01c400',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '66e1dace-106a-478b-bf82-9f85ce01c400',
            'cooperative': 'Compania de Produtos Energéticos',
            'maximumMonthlyAmount': 500,
            'minimumMonthlyAmount': 100,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.602715,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.602723,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/a8db730d-e62e-4fd5-a80b-bcef3f3506a3',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': 'a8db730d-e62e-4fd5-a80b-bcef3f3506a3',
            'cooperative': 'Cooperativa Sustentável',
            'maximumMonthlyAmount': 600,
            'minimumMonthlyAmount': 200,
            'savingsPercentage': 0.3
        },
        {
            '_created': 1660975901.579135,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.579143,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/88d6e525-0478-45e3-9015-ecc2b3402524',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '88d6e525-0478-45e3-9015-ecc2b3402524',
            'cooperative': 'Cooperativa Sustentável',
            'maximumMonthlyAmount': 700,
            'minimumMonthlyAmount': 300,
            'savingsPercentage': 0.4
        },
        {
            '_created': 1660975901.553346,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.553354,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/911977d3-4662-44bb-a0c6-9683c87708a7',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '911977d3-4662-44bb-a0c6-9683c87708a7',
            'cooperative': 'Cooperativa Sustentável',
            'maximumMonthlyAmount': 350,
            'minimumMonthlyAmount': 50,
            'savingsPercentage': 0.25
        },
        {
            '_created': 1660975901.532958,
            '_data_type': 'cooperative-offers',
            '_is_deleted': false,
            '_modified': 1660975901.532969,
            '_self_link': 'https://crudapi.co.uk/api/v1/cooperative-offers/0590e3b8-8702-45c7-ad15-75831dc34944',
            '_user': '86c9d0dd-9579-490b-a148-93efe09805b4',
            '_uuid': '0590e3b8-8702-45c7-ad15-75831dc34944',
            'cooperative': 'Cooperativa Sustentável',
            'maximumMonthlyAmount': 500,
            'minimumMonthlyAmount': 100,
            'savingsPercentage': 0.4
        }
    ],
    'next_page': null
};