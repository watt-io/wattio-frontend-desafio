import '../../core/models/cooperativa.dart';
import '../../data/cooperativa_repository.dart';

class CalcularOfertasUseCase {
  final CooperativaRepository repository;

  CalcularOfertasUseCase(this.repository);

  List<Cooperativa> execute({
    required double valorConta,
    required TipoCliente tipoCliente,
    required OrdenacaoOferta ordenacao,
    String? regiao,
    int? prazoMaximo,
  }) {
    // Encadeia filtros de negocio para retornar apenas ofertas elegiveis.
    final ofertas = repository
        .buscarOfertas(
          valor: valorConta,
          tipoCliente: tipoCliente,
          regiao: regiao,
        )
        // Apenas ofertas que atendem o prazo maximo
        .where((coop) => coop.atendePrazo(prazoMaximo))
        .toList();
    return _ordenar(ofertas, ordenacao, valorConta);
  }

  List<Cooperativa> _ordenar(
    List<Cooperativa> ofertas,
    OrdenacaoOferta ordenacao,
    double valorConta,
  ) {
    final sorted = List<Cooperativa>.from(ofertas);
    switch (ordenacao) {
      case OrdenacaoOferta.maiorEconomia:
        // Usa economia liquida para refletir desconto menos taxa.
        sorted.sort(
          (a, b) => b
              .calcularEconomiaLiquida(valorConta)
              .compareTo(a.calcularEconomiaLiquida(valorConta)),
        );
        break;
      case OrdenacaoOferta.maiorDesconto:
        sorted.sort((a, b) => b.desconto.compareTo(a.desconto));
        break;
      case OrdenacaoOferta.menorMinimo:
        sorted.sort(
          (a, b) => a.valorMinimoMensal.compareTo(b.valorMinimoMensal),
        );
        break;
      case OrdenacaoOferta.nome:
        sorted.sort((a, b) => a.nome.compareTo(b.nome));
        break;
    }
    return sorted;
  }
}
