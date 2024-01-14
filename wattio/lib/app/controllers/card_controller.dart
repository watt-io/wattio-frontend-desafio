import 'package:wattio/app/models/model/cooperativo_model.dart';
import 'package:wattio/app/models/model/point_model.dart';

/// Essa classe representa um controlador de acordo com o MVC (Model View Controller) e
/// serve como um intermediador entre o modelo e a view do card das cooperativas do aplicativo.
/// Inicializa os pontos para que sejam desenhados no gráfico de linhas.
/// @author Paulo Henrique Caserta

class CardController {
  // Função que mapeia o atributo (variável de classe) de quantidade de pessoas atendidas e retorna
  // uma lista de pontos para a view desenhar o gráfico;
  List<Point> inicializarPoints(Cooperativa cooperativa) {
    return cooperativa.quantPessoasAtendidas
        .asMap()
        .map((key, value) =>
            MapEntry(key, Point(x: key.toDouble(), y: value.toDouble())))
        .values
        .toList();
  }
}
