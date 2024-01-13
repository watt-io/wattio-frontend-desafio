import 'package:wattio/app/models/model/cooperativo_model.dart';

/// Representa o repositório de Cooperativas.
/// Dados fictícios.
/// @author - Paulo Henrique Caserta

class CooperativaRepository {
  // Data que será inicializada pelo CooperativaController
  List<Cooperativa> cooperativas = [];

  // Método que retorna as Cooperativas filtradas com base em um valor.
  List<Cooperativa> filtrarCooperativas(double valor) {
    var cooperativasFiltradas = cooperativas
        .where((cooperativa) =>
            valor <= cooperativa.valorMaximo &&
            valor >= cooperativa.valorMinimo)
        .toList();
    return cooperativasFiltradas;
  }
}
