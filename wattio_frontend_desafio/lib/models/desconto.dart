class Desconto {
  double? _valorMensal;
  double? _valorAnual;

  double? get valorMensal => _valorMensal;
  double? get valorAnual => _valorAnual;

  Desconto.fromJson(Map<String, dynamic> json) {
    _valorMensal = json['valorMensal'];
    _valorAnual = json['valorAnual'];
  }
}
