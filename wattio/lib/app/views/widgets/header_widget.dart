import 'package:flutter/material.dart';
import 'package:wattio/app/views/widgets/rich_text_widget.dart';

/// Widget responsável pela criação e visualização do cabeçalho (Nome + Ícone).
/// @author Paulo Henrique Caserta

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RichTextWidget(
            primeiraString: 'Energy',
            segundaString: 'Solution',
            primeiroFontSize: 40,
            primeiroColor: Colors.white,
            segundoColor: Colors.yellow,
            fontFamily: 'RobotoCondensed',
            textAlign: TextAlign.start,
          ),
          Hero(
            tag: 'icon',
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
