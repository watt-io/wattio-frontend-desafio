import 'dart:convert';

import 'package:wattio/src/shared/models/proposal_model.dart';

import '../internet_controller.dart';
import '../mock/data.dart';
import 'interface/i_repository_api.dart';

class RepositoryApi with Data implements IRepositoryApi {
  @override
  Future<List<ProposalModel>?> getApiData() async {
    final List<ProposalModel> proposals = [];
    final json = jsonDecode(dataApi);

    for (var element in json) {
      proposals.add(ProposalModel.fromJson(element));
    }

    await Future.delayed(const Duration(seconds: 3));
    return InternetController.isInternetOn.value ? proposals : null;
  }
}
