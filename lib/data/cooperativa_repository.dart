import '../core/models/cooperativa.dart';

// Classe que representa o repositório de cooperativas, contendo uma lista de cooperativas.
class CooperativaRepository {
  final List<Cooperativa> _cooperativas = [
    Cooperativa(
      id: 'enerfacil',
      nome: 'EnerFácil',
      descricao: 'Plano flexível com suporte regional.',
      modalidade: 'Assinatura Solar',
      valorMinimoMensal: 1000,
      valorMaximoMensal: 40000,
      desconto: 0.20,
      taxaAdministrativa: 0.02,
      prazoMinimoMeses: 12,
      carenciaMeses: 2,
      tiposCliente: [TipoCliente.pessoaFisica, TipoCliente.pessoaJuridica],
      regioes: ['Sudeste', 'Sul'],
    ),
    Cooperativa(
      id: 'enerlimpa',
      nome: 'EnerLimpa',
      descricao: 'Energia limpa com melhor custo para empresas.',
      modalidade: 'Cooperativa Premium',
      valorMinimoMensal: 10000,
      valorMaximoMensal: 80000,
      desconto: 0.25,
      taxaAdministrativa: 0.015,
      prazoMinimoMeses: 24,
      carenciaMeses: 3,
      tiposCliente: [TipoCliente.pessoaJuridica],
      regioes: ['Sudeste', 'Centro-Oeste'],
    ),
    Cooperativa(
      id: 'energrande',
      nome: 'EnerGrande',
      descricao: 'PPA para alto consumo com desconto máximo.',
      modalidade: 'PPA Empresarial',
      valorMinimoMensal: 40000,
      valorMaximoMensal: 100000,
      desconto: 0.30,
      taxaAdministrativa: 0.012,
      prazoMinimoMeses: 36,
      carenciaMeses: 6,
      tiposCliente: [TipoCliente.pessoaJuridica],
      regioes: ['Sudeste', 'Sul', 'Nordeste'],
    ),
    Cooperativa(
      id: 'solamiga',
      nome: 'SolAmiga',
      descricao: 'Comunidade solar com entrada leve para residencias.',
      modalidade: 'Comunidade Solar',
      valorMinimoMensal: 300,
      valorMaximoMensal: 8000,
      desconto: 0.15,
      taxaAdministrativa: 0.01,
      prazoMinimoMeses: 12,
      carenciaMeses: 1,
      tiposCliente: [TipoCliente.pessoaFisica],
      regioes: ['Norte', 'Nordeste'],
    ),
    Cooperativa(
      id: 'verdeja',
      nome: 'VerdeJá',
      descricao: 'Modelo hibrido com estabilidade de desconto.',
      modalidade: 'Consorcio Verde',
      valorMinimoMensal: 1500,
      valorMaximoMensal: 25000,
      desconto: 0.18,
      taxaAdministrativa: 0.02,
      prazoMinimoMeses: 18,
      carenciaMeses: 2,
      tiposCliente: [TipoCliente.pessoaFisica, TipoCliente.pessoaJuridica],
      regioes: ['Sul', 'Sudeste', 'Centro-Oeste'],
    ),
    Cooperativa(
      id: 'coopluz',
      nome: 'CoopLuz',
      descricao: 'Especialista em comércios e pequenas industrias.',
      modalidade: 'Energia Compartilhada',
      valorMinimoMensal: 5000,
      valorMaximoMensal: 60000,
      desconto: 0.22,
      taxaAdministrativa: 0.018,
      prazoMinimoMeses: 24,
      carenciaMeses: 4,
      tiposCliente: [TipoCliente.pessoaJuridica],
      regioes: ['Nordeste', 'Centro-Oeste'],
    ),
  ];

  // Retorna uma lista de cooperativas que atendem aos filtros de valor, tipo de cliente e regiao.
  List<Cooperativa> buscarOfertas({
    required double valor,
    required TipoCliente tipoCliente,
    String? regiao,
  }) {
    return _cooperativas
        .where((c) => c.aceitaValor(valor))
        .where((c) => c.aceitaTipo(tipoCliente))
        .where((c) => c.atendeRegiao(regiao))
        .toList();
  }

  List<String> regioesDisponiveis() {
    final set = <String>{};
    for (final coop in _cooperativas) {
      set.addAll(coop.regioes);
    }
    final list = set.toList()..sort();
    return ['Todas', ...list];
  }
}
