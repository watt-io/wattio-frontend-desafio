/// Representa o modelo de uma Cooperativa.
/// @author - Paulo Henrique Caserta

class Cooperativa {
  final String nome;
  final int valorMinimo;
  final int valorMaximo;
  final double desconto;
  final String icon;
  final String backgroundCooperative;
  final List<double> quantPessoasAtendidas;

  Cooperativa(
      {required this.nome,
      required this.valorMinimo,
      required this.valorMaximo,
      required this.desconto,
      required this.icon,
      required this.backgroundCooperative,
      required this.quantPessoasAtendidas});

  // Sobreescrita do método toString(Object)
  @override
  String toString() {
    // TODO: implement toString
    return nome;
  }
}
