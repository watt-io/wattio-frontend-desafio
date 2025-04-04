import 'package:flutter_triple/flutter_triple.dart';

import '../../shared/repository/repository.dart';
import '../models/cooperativa_model.dart';

class CooperativeStore extends StreamStore<Exception, List<CooperativeModel>> {
  final Repository _repository;

  CooperativeStore(this._repository) : super([]);

  Future<List<CooperativeModel>> getCooperatives(double valueEnergy) async {
    setLoading(true);
    //delay para exibir loading no estado (dados estão mockados)
    await Future.delayed(
      const Duration(seconds: 1),
    );
    final response = await _repository.getCooperatives();
    return response.fold(
      (error) {
        setError(error);
        setLoading(false);
        return <CooperativeModel>[];
      },
      (list) {
        setLoading(false);
        update(
          getCooperativaWithLowerDiscount(list, valueEnergy),
          force: true,
        );
        return list;
      },
    );
  }

  List<CooperativeModel> getCooperativaWithLowerDiscount(
    List<CooperativeModel> cooperatives,
    double valueEnergy,
  ) {
    //Filtra cooperativas que encaixa no valor da energia
    List<CooperativeModel> eligibleCooperatives = cooperatives
        .where((coop) =>
            valueEnergy >= coop.valorMinimoMensal! &&
            valueEnergy <= coop.valorMaximoMensal!)
        .toList();

    if (eligibleCooperatives.isEmpty) {
      return [];
    }

    //busca index do melhor desconto dentre as cooperativas filtradas
    int bestCooperativeIndex = 0;
    for (int i = 1; i < eligibleCooperatives.length; i++) {
      if (eligibleCooperatives[i].desconto! >
          eligibleCooperatives[bestCooperativeIndex].desconto!) {
        bestCooperativeIndex = i;
      }
    }

    CooperativeModel bestCooperative =
        eligibleCooperatives[bestCooperativeIndex];

    eligibleCooperatives.removeAt(bestCooperativeIndex);

    List<CooperativeModel> notEligibleCooperatives = cooperatives
        .where((coop) =>
            valueEnergy < coop.valorMinimoMensal! ||
            valueEnergy > coop.valorMaximoMensal!)
        .toList();

    List<CooperativeModel> result = [bestCooperative];
    result.addAll(eligibleCooperatives);
    result.addAll(notEligibleCooperatives);

    return result;
  }
}
