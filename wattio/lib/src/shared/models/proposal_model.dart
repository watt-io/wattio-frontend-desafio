class ProposalModel {
  final String nome;
  final int valorMinimoMensal;
  final int valorMaximoMensal;
  final double desconto;

  ProposalModel.fromJson(Map<String, Object?> json)
      : nome = json['nome'] as String,
        valorMinimoMensal = json['valorMinimoMensal'] as int,
        valorMaximoMensal = json['valorMaximoMensal'] as int,
        desconto = json['desconto'] as double;

  Map<String, Object?> toMap() => {
        'nome': nome,
        'valorMinimoMensal': valorMinimoMensal,
        'valorMaximoMensal': valorMaximoMensal,
        'desconto': desconto,
      };
}
