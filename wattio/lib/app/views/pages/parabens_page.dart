import 'package:flutter/material.dart';
import 'package:wattio/app/views/widgets/header_widget.dart';
import 'package:wattio/app/views/widgets/rich_text_widget.dart';
import 'package:wattio/util/screen_util.dart';
import 'package:wattio/util/theme/app_colors.dart';

/// Tela responsável pela visualização do parabéns após o contrato.
/// @author Paulo Henrique Caserta

class ParabensPage extends StatelessWidget {
  final String nome;
  const ParabensPage({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/parabens.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: ScreenUtil.getScreenWidth(context),
              height: ScreenUtil.getScreenHeight(context) / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.azul, AppColors.azul.withOpacity(0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const HeaderWidget(),
                  RichTextWidget(
                    primeiraString: 'A $nome',
                    segundaString: 'agradece!',
                    primeiroFontSize: 30,
                    segundoFontSize: 50,
                    primeiroColor: Colors.white,
                    fontFamily: 'RobotoCondensed',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
