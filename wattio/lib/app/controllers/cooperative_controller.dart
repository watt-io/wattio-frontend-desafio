import 'package:wattio/app/models/model/cooperativo_model.dart';
import 'package:wattio/app/models/repositories/cooperativa_repository.dart';

/// Essa classe representa um controlador de acordo com o MVC (Model View Controller) e
/// serve para inicializar o repositório de Cooperativas, contendo método para o mesmo.
/// @author Paulo Henrique Caserta

class CooperativaController {
  // Instânciando o repositório de Cooperativas
  final CooperativaRepository _data = CooperativaRepository();

  // Aplicando encapsulamento
  CooperativaRepository get data => _data;

  // Dados mockados (pode ter vindo de uma api, sei lá)
  final List<Map<String, dynamic>> _cooperativas = [
    {
      'nome': 'EnerFácil',
      'valorMinimo': 1000,
      'maximo': 40000,
      'desconto': .2,
      'icon': 'assets/images/EnerFacil.png',
      'backgroundCooperative': 'assets/images/EnerFacilCooperative.jpg',
      'quantPessoasAtendidas': [30000, 50000, 25000, 43000, 40000]
    },
    {
      'nome': 'EnerLimpa',
      'minimo': 10000,
      'maximo': 80000,
      'desconto': .25,
      'icon': 'assets/images/EnerLimpa.png',
      'backgroundCooperative': 'assets/images/EnerLimpaCooperative.jpg',
      'quantPessoasAtendidas': [10000, 60000, 25000, 28000, 50000]
    },
    {
      'nome': 'EnerGrande',
      'minimo': 40000,
      'maximo': 100000,
      'desconto': .3,
      'icon': 'assets/images/EnerGrande.png',
      'backgroundCooperative': 'assets/images/EnerGrandeCooperative.jpg',
      'quantPessoasAtendidas': [30000, 20000, 30000, 50000, 40000],
    }
  ];

  // Método que inicializa o repositório de Cooperativa.
  void inicializeRepository() {
    _data.cooperativas = inicializeData(_cooperativas);

    // CONTÉM TESTE UNITÁRIO
  }

  // Método que transforma uma cooperativa em um objeto Cooperativa
  List<Cooperativa> inicializeData(List<Map<String, dynamic>> data) {
    return data.map((cooperativaData) {
      // Criando objetos Cooperativa com base nos valores do Map
      return Cooperativa(
        nome: cooperativaData['nome'] ?? '',
        valorMinimo: cooperativaData['minimo'] ?? 0,
        valorMaximo: cooperativaData['maximo'] ?? 0,
        desconto: cooperativaData['desconto'] ?? 0.0,
        icon: cooperativaData['icon'] ?? '',
        backgroundCooperative: cooperativaData['backgroundCooperative'] ?? '',
        // Percorrendo a lista de valores 'quantPessoasAtendidas'
        quantPessoasAtendidas:
            (cooperativaData['quantPessoasAtendidas'] as List<int>?)
                    ?.map((value) => value.toDouble())
                    .toList() ??
                [],
      );
    }).toList();
  }
}
