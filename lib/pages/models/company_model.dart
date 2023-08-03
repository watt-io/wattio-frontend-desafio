import 'dart:convert';

class CompanyModel {
  CompanyModel({
    required this.nome,
    required this.valorMinMensal,
    required this.valorMaxMensal,
    required this.desconto,
    required this.formaContratacao,
    required this.planoContratacao,
    required this.avaliacoes,
    required this.prazoDePagamento,
    this.isSelected = false,
  });

  String nome;
  int valorMinMensal;
  int valorMaxMensal;
  double desconto;
  bool isSelected;
  String formaContratacao;
  String planoContratacao;
  double avaliacoes;
  int prazoDePagamento;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'valor_minimo_mensal': valorMinMensal,
      'valor_maximo_mensal': valorMaxMensal,
      'desconto': desconto,
      'forma_contratacao': formaContratacao,
      'plano_contratacao': planoContratacao,
      'avaliacoes': avaliacoes,
      'prazo_de_pagamento': prazoDePagamento,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      nome: map['nome'] as String,
      valorMinMensal: map['valor_minimo_mensal'] as int,
      valorMaxMensal: map['valor_maximo_mensal'] as int,
      desconto: map['desconto'] as double,
      formaContratacao: map['forma_contratacao'] as String,
      planoContratacao: map['plano_contratacao'] as String,
      avaliacoes: map['avaliacoes'] as double,
      prazoDePagamento: map['prazo_de_pagamento'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
