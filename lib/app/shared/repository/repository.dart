import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/cooperativa_model.dart';

class Repository extends Disposable {
  Future<Either<Exception, List<CooperativeModel>>> getCooperatives() async {
    try {
      var response = 200;
      if (response == 200) {
        List<CooperativeModel> listaLocal = [];

        for (var json in mockData) {
          listaLocal.add(CooperativeModel.fromJson(json));
        }

        return Right(listaLocal);
      }
      return Right(List<CooperativeModel>.empty());
    } on Exception catch (e) {
      return Left(
        Exception(e),
      );
    }
  }

  // Dados mockados
  final mockData = [
    {
      'nome': 'EnerFácil',
      'valorMinimoMensal': 100,
      'valorMaximoMensal': 40000,
      'desconto': .2,
    },
    {
      'nome': 'EnerLimpa',
      'valorMinimoMensal': 10000,
      'valorMaximoMensal': 80000,
      'desconto': .25,
    },
    {
      'nome': 'EnerGrande',
      'valorMinimoMensal': 40000,
      'valorMaximoMensal': 100000,
      'desconto': .3,
    }
  ];

  @override
  void dispose() {}
}
