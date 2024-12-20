mixin Data {
  final String dataApi = ''' [
    {
      "nome": "EnerFácil",
      "valorMinimoMensal": 1000,
      "valorMaximoMensal": 4000,
      "desconto": 0.20
    },
    {
      "nome": "EnerLimpa",
      "valorMinimoMensal": 10000,
      "valorMaximoMensal": 80000,
      "desconto": 0.25
    },
    {
      "nome": "EnerGrande",
      "valorMinimoMensal": 40000,
      "valorMaximoMensal": 100000,
      "desconto": 0.30
    },
    {
      "nome": "EnerGiga",
      "valorMinimoMensal": 9000,
      "valorMaximoMensal": 70000,
      "desconto": 0.40
    }
  ]''';
}
