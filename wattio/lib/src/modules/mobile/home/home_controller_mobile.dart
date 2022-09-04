import 'package:flutter/widgets.dart';

import '../../../shared/models/proposal_model.dart';
import '../../../shared/repository/interface/i_repository_api.dart';
import '../../../shared/repository/repository_api.dart';

class HomeController {
  final IRepositoryApi _iRepositoryApi = RepositoryApi();

  final double valueMin = 1000;
  final double valueMax = 100000;

  final ValueNotifier<double> currentValue = ValueNotifier<double>(1000);

  late final TextEditingController textEditingController =
      TextEditingController(text: 'R\$$valueMin');

  Future<List<ProposalModel>?> getProposals() async =>
      await _iRepositoryApi.getApiData();

  void keyboardInput(String inputValue) {
    final RegExp regExp = RegExp(r'[^0-9.]');

    final String newValue = inputValue.replaceAll(regExp, '');

    if ((double.tryParse(newValue) ?? 0) >= 1000 &&
        (double.tryParse(newValue) ?? 200000) <= 100000) {
      currentValue.value = double.parse(newValue);
    }
  }

  void onSlider(double newValue) {
    currentValue.value = newValue;
    textEditingController.text = 'R\$${currentValue.value.toStringAsFixed(2)}';
  }

  void dispose() {
    textEditingController.dispose();
  }
}
