import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/shared/internet_controller.dart';
import 'package:wattio/src/shared/models/proposal_model.dart';
import 'package:wattio/src/shared/repository/interface/i_repository_api.dart';
import 'package:wattio/src/shared/repository/repository_api.dart';

void main() {
  group('Api tests', () {
    test('get data api', () async {
      final IRepositoryApi repositoryApi = RepositoryApi();

      expect(await repositoryApi.getApiData() is List<ProposalModel>, true);
    });

    test('no connection api', () async {
      final IRepositoryApi repositoryApi = RepositoryApi();

      InternetController.changeStateInternet(true);

      expect(await repositoryApi.getApiData(), null);
    });
  });
}
