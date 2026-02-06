import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.store, color: Colors.white, size: 60),
            SizedBox(width: 10),
            Text(
              'Calcule a economia\nda sua empresa',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: 14),
        Text(
          'O valor médio mensal da minha conta de energia é:',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textLight, fontSize: 13),
        ),
      ],
    );
  }
}
