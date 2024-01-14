import 'package:flutter/material.dart';

import '../../../shared/util/theme/colors_app.dart';
import '../model/cooperative.dart';

class CardOffert extends StatelessWidget {
  final Cooperative cooperative;
  final int index;

  const CardOffert({
    required this.cooperative,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsApp.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Oferta $index',
              style: const TextStyle(
                color: ColorsApp.primary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: ColorsApp.black,
                fontSize: 16,
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: 'Cooperativa: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.primary2,
                  ),
                ),
                TextSpan(
                  text: cooperative.name,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: ColorsApp.black,
                fontSize: 16,
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: '   Economia: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.primary2,
                  ),
                ),
                TextSpan(
                  text: '${cooperative.economy * 100}%',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
