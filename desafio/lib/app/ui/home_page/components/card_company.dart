import 'package:desafio/app/constants/app_colors.dart';
import 'package:desafio/app/model/company_model.dart';
import 'package:desafio/app/utils/app_converters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardCompanies extends StatelessWidget {
  const CardCompanies({super.key, required this.company, required this.color});

  final CompanyModel company;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: color),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Empresa: ${company.name}'),
            Text('Desconto:  ${AppConverters.formatarPorcentagem(company.discount)}'),
            Text('Forma de Contrato: ${company.formOfHiring}'),
            Text('Tempo de Contrato: ${company.contractPlan}'),
            Text('Prazo de pagamento: ${company.paymentTerm.toString()} dias'),
            Row(
              children: [
                const Text('Avaliação: '),
                RatingBar(
                  initialRating: company.assessments,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 20.0,
                  ratingWidget: RatingWidget(
                    full: const Icon(Icons.star, color: Colors.amber),
                    half: const Icon(Icons.star_half, color: Colors.amber),
                    empty: const Icon(Icons.star_border, color: Colors.amber),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    debugPrint(rating.toString());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
