import 'dart:convert';

List<Offer> parseOffers(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
}

class Offer {
  final String nome;
  final String valorMinimoMensal;
  final String ValorMaximoMensal;
  final String desconto;
  final String fisicaOuJurisica;
  final String imagen;

  const Offer({
    required this.nome,
    required this.valorMinimoMensal,
    required this.ValorMaximoMensal,
    required this.desconto,
    required this.fisicaOuJurisica,
    required this.imagen,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      nome: json['nome'] as String,
      valorMinimoMensal: json['valorMinimoMensal'] as String,
      ValorMaximoMensal: json['ValorMaximoMensal'] as String,
      desconto: json['desconto'] as String,
      fisicaOuJurisica: json['fisicaOuJurisica'] as String,
      imagen: json['imagen'] as String,
    );
  }
}
