/// Essa classe representa a lógica do negócio no aplicativo. É responsável por realizar os
/// cálculos com base no desconto ofertado.
/// @author Paulo Henrique Caserta

// Método que calcula o desconto mensal.
class CalculadoraDeDesconto {
  double calculaDescontoMensal(double valor, double desconto) {
    return (valor * desconto);
  }

// Método que calcula o desconto anual.
  double calculaDescontoAnual(double valor, double desconto) {
    return calculaDescontoMensal(valor, desconto) * 12;
  }
}
