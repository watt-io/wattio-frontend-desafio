import 'package:wattio/app/models/repositories/cooperativa_repository.dart';

/// Essa classe representa um controlador de acordo com o MVC (Model View Controller) e
/// serve como um intermediador entre a base de dados e a home view do aplicativo.
/// @author Paulo Henrique Caserta

class HomeController {
  CooperativaRepository data;

  // Passando um Data como refêrencia
  HomeController(this.data);
}
