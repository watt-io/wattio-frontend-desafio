import 'dart:math';

// Aqui eu crio um enum para representar os tipos de clientes que a cooperativa aceita.
enum TipoCliente { pessoaFisica, pessoaJuridica }

extension TipoClienteLabel on TipoCliente {
  String get label {
    switch (this) {
      case TipoCliente.pessoaFisica:
        return 'Pessoa Fisica';
      case TipoCliente.pessoaJuridica:
        return 'Pessoa Juridica';
    }
  }
}

// Aqui eu crio um enum para representar as opcoes de ordenacao das ofertas.
enum OrdenacaoOferta { maiorEconomia, maiorDesconto, menorMinimo, nome }

extension OrdenacaoOfertaLabel on OrdenacaoOferta {
  String get label {
    switch (this) {
      case OrdenacaoOferta.maiorEconomia:
        return 'Maior economia';
      case OrdenacaoOferta.maiorDesconto:
        return 'Maior desconto';
      case OrdenacaoOferta.menorMinimo:
        return 'Menor minimo';
      case OrdenacaoOferta.nome:
        return 'Nome A-Z';
    }
  }
}

// Aqui eu crio uma classe para representar uma cooperativa.
class Cooperativa {
  final String id;
  final String nome;
  final String descricao;
  final String modalidade;
  final double valorMinimoMensal;
  final double valorMaximoMensal;
  final double desconto;
  final double taxaAdministrativa;
  final int prazoMinimoMeses;
  final int carenciaMeses;
  final List<TipoCliente> tiposCliente;
  final List<String> regioes;

  Cooperativa({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.modalidade,
    required this.valorMinimoMensal,
    required this.valorMaximoMensal,
    required this.desconto,
    required this.taxaAdministrativa,
    required this.prazoMinimoMeses,
    required this.carenciaMeses,
    required this.tiposCliente,
    required this.regioes,
  });

  // Metodos de negocio.
  bool aceitaValor(double valor) {
    return valor >= valorMinimoMensal && valor <= valorMaximoMensal;
  }

  bool aceitaTipo(TipoCliente tipo) {
    return tiposCliente.contains(tipo);
  }

  bool atendeRegiao(String? regiao) {
    if (regiao == null || regiao.isEmpty || regiao == 'Todas') {
      return true;
    }
    return regioes.contains(regiao);
  }

  bool atendePrazo(int? prazoMaximo) {
    if (prazoMaximo == null || prazoMaximo <= 0) {
      return true;
    }
    return prazoMinimoMeses <= prazoMaximo;
  }

  double calcularEconomiaBruta(double valorConta) {
    return valorConta * desconto;
  }

  double calcularTaxaAdministrativa(double valorConta) {
    return valorConta * taxaAdministrativa;
  }

  double calcularEconomiaLiquida(double valorConta) {
    final economia = calcularEconomiaBruta(valorConta);
    final taxa = calcularTaxaAdministrativa(valorConta);
    // Evita economia negativa caso a taxa seja maior que o desconto.
    return max(0, economia - taxa);
  }
}
