class Cooperativa {
  final String _nome;
  final int _valorMinimoMensal;
  final int _valorMaximoMensal;
  final double _desconto;

  String get nome => _nome;
  int get valorMinimoMensal => _valorMinimoMensal;
  int get valorMaximoMensal => _valorMaximoMensal;
  double get desconto => _desconto;

  Cooperativa.fromJson(Map<String, dynamic> json)
      : _nome = json['nome'],
        _valorMinimoMensal = json['valorMinimoMensal'],
        _valorMaximoMensal = json['valorMaximoMensal'],
        _desconto = json['desconto'];
}
