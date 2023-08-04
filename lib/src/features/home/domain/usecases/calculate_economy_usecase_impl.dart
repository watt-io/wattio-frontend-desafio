import 'package:frontend_wattio/src/core/architecture/usecase.dart';

import '../../home.dart';

class CalculateEconomyUseCaseImpl {
  HomeRepository repository;

  CalculateEconomyUseCaseImpl(this.repository);

  call(CalculateEconomyParams input) async {
    return repository.calculateEconomy(input);
  }
}
