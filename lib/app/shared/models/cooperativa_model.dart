import 'package:collection/collection.dart';

class CooperativeModel {
  String? nome;
  int? valorMinimoMensal;
  int? valorMaximoMensal;
  double? desconto;

  CooperativeModel({
    this.nome,
    this.valorMinimoMensal,
    this.valorMaximoMensal,
    this.desconto,
  });

  @override
  String toString() {
    return 'CooperativaModel(nome: $nome, valorMinimoMensal: $valorMinimoMensal, valorMaximoMensal: $valorMaximoMensal, desconto: $desconto)';
  }

  factory CooperativeModel.fromJson(Map<String, dynamic> json) {
    return CooperativeModel(
      nome: json['nome'] as String?,
      valorMinimoMensal: json['valorMinimoMensal'] as int?,
      valorMaximoMensal: json['valorMaximoMensal'] as int?,
      desconto: json['desconto'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'valorMinimoMensal': valorMinimoMensal,
        'valorMaximoMensal': valorMaximoMensal,
        'desconto': desconto,
      };

  CooperativeModel copyWith({
    String? nome,
    int? valorMinimoMensal,
    int? valorMaximoMensal,
    double? desconto,
  }) {
    return CooperativeModel(
      nome: nome ?? this.nome,
      valorMinimoMensal: valorMinimoMensal ?? this.valorMinimoMensal,
      valorMaximoMensal: valorMaximoMensal ?? this.valorMaximoMensal,
      desconto: desconto ?? this.desconto,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CooperativeModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      nome.hashCode ^
      valorMinimoMensal.hashCode ^
      valorMaximoMensal.hashCode ^
      desconto.hashCode;
}
