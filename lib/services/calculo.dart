
import 'package:simulador/models/coop_model.dart';

class Calculo {
    
    double calcularEconomiaAnual(CoopModel cooperativa, double valorConta) {
    double valorOferta = cooperativa.desconto * valorConta;
    // Implemente a lógica de cálculo com base na oferta escolhida e o valor médio da conta
    return valorOferta * 12;
  }

  double calcularEconomiaMensal(CoopModel cooperativa, double valorConta) {
    double valorOferta = cooperativa.desconto * valorConta;
    // Implemente a lógica de cálculo com base na oferta escolhida e o valor médio da conta
    return valorOferta;
  }
}
