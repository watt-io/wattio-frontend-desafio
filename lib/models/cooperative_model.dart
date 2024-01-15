import 'package:desafio_wattio/models/location_model.dart';

class Cooperative {
  String? nome;
  int? valorMinimoMensal;
  int? valorMaximoMensal;
  double? desconto;
  Localidade? localidade;
  String? contato;
  String? contrato;
  String? modelo;

  Cooperative(
      {this.nome,
      this.valorMinimoMensal,
      this.valorMaximoMensal,
      this.desconto,
      this.localidade,
      this.contato,
      this.contrato,
      this.modelo});

  Cooperative.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    valorMinimoMensal = json['valorMinimoMensal'];
    valorMaximoMensal = json['valorMaximoMensal'];
    desconto = json['desconto'];
    localidade = json['localidade'] != null
        ? Localidade.fromJson(json['localidade'])
        : null;
    contato = json['contato'];
    contrato = json['contrato'];
    modelo = json['modelo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['valorMinimoMensal'] = valorMinimoMensal;
    data['valorMaximoMensal'] = valorMaximoMensal;
    data['desconto'] = desconto;
    if (localidade != null) {
      data['localidade'] = localidade!.toJson();
    }
    data['contato'] = contato;
    data['contrato'] = contrato;
    data['modelo'] = modelo;
    return data;
  }
}