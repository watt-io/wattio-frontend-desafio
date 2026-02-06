class Cooperativa {
  final String nome;
  final double valorMinimoMensal;
  final double valorMaximoMensal;
  final double desconto; 

  const Cooperativa({
    required this.nome,
    required this.valorMinimoMensal,
    required this.valorMaximoMensal,
    required this.desconto,
  });

  bool aceitaValor(double conta) =>
      conta >= valorMinimoMensal && conta <= valorMaximoMensal;

  double calcularEconomia(double conta) => conta * desconto;

  double valorComDesconto(double conta) => conta - calcularEconomia(conta);
}
