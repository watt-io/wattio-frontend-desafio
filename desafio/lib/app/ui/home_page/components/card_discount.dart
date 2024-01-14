import 'package:desafio/app/constants/app_colors.dart';
import 'package:desafio/app/widgets/app_button_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDiscount extends StatelessWidget {
  const CardDiscount({
    super.key,
    required this.discountAmount,
    required this.valueDescont,
    required this.nameCompany,
    required this.discount,
    required this.months,
    required this.isLoading,
    required this.onTap,
  });

  final String discountAmount;
  final String valueDescont;
  final String nameCompany;
  final String discount;
  final String months;
  final bool isLoading;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      surfaceTintColor: AppColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Resumo do seu desconto:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Sua economia no periodo do contrato será de até: ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: discountAmount,
                      style: const TextStyle(color: AppColors.red, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Valor do desconto mensal: ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: valueDescont,
                      style: const TextStyle(color: AppColors.green, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            const SizedBox(height: 10),
            Text(
              'Empresa: $nameCompany',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Desconto de: $discount ',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Tempo de contrato: $months meses',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            AppButtonLoading(
              width: Get.width,
              onTap: onTap,
              isLoading: isLoading,
              text: 'Contratar',
              color: AppColors.green,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
