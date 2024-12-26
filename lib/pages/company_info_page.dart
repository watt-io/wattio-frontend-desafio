import 'package:flutter/material.dart';

import 'package:energy_marketplace/pages/models/company_model.dart';

class CompanyInfoPage extends StatelessWidget {
  const CompanyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map<String, dynamic>;
    final currentModel = args['currentModel'] as CompanyModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(currentModel.nome),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CompanyDetails(
                title: 'Nome',
                subTitle: currentModel.nome,
              ),
              CompanyDetails(
                title: 'Desconto',
                subTitle: '${currentModel.desconto * 100} %',
              ),
              CompanyDetails(
                title: 'Forma de contratação',
                subTitle:
                    'A empresa aceita a seguinte forma de contratação: ${currentModel.formaContratacao}',
              ),
              CompanyDetails(
                title: 'Prazo de pagamento',
                subTitle: '${currentModel.prazoDePagamento} dias após a data de expiração do contrato com sujeito a multa',
              ),
              CompanyDetails(
                title: 'Plano de contratação',
                subTitle: currentModel.planoContratacao,
              ),
              CompanyDetails(
                title: 'Avaliações',
                subTitle: '${currentModel.avaliacoes}',
                icon: const Icon(
                  Icons.star_border_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({
    Key? key,
    required this.title,
    required this.subTitle,
    this.icon,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              if (icon == null) ...[
                Expanded(
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ] else ...[
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                icon!,
              ],
            ],
          ),
        ],
      ),
    );
  }
}
