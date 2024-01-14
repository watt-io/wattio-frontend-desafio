import 'package:desafio/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      title: const Text('Parabéns!!!', style: TextStyle(color: AppColors.red)),
      content: const Text('Seu plano foi contratado com sucesso!',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        TextButton(
          onPressed: onTap!,
          child: const Text(
            'Sair!',
            style: TextStyle(color: AppColors.red, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
