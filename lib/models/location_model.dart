class Localidade {
  String? pais;
  String? estado;
  String? cidade;

  Localidade({this.pais, this.estado, this.cidade});

  Localidade.fromJson(Map<String, dynamic> json) {
    pais = json['pais'];
    estado = json['estado'];
    cidade = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pais'] = pais;
    data['estado'] = estado;
    data['cidade'] = cidade;
    return data;
  }
}