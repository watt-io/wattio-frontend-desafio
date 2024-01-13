import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattio/app/controllers/cooperativa_page_controller.dart';
import 'package:wattio/app/models/model/cooperativo_model.dart';
import 'package:wattio/app/views/animations/fade_animation.dart';
import 'package:wattio/app/views/pages/parabens_page.dart';
import 'package:wattio/app/views/widgets/cifrao_widget.dart';
import 'package:wattio/app/views/widgets/rich_text_widget.dart';
import 'package:wattio/util/format_number_util.dart';
import 'package:wattio/util/screen_util.dart';
import 'package:wattio/util/theme/app_colors.dart';

/// Tela responsável pela visualização da Cooperativa juntamente com os cálculos de desconto.
/// @author Paulo Henrique Caserta

class CooperativaPage extends StatefulWidget {
  final Cooperativa cooperativa;
  final double valorSlider;
  const CooperativaPage({
    required this.cooperativa,
    required this.valorSlider,
    super.key,
  });

  @override
  State<CooperativaPage> createState() => _CooperativaPageState();
}

class _CooperativaPageState extends State<CooperativaPage> {
  // Declarando controlador e as variáveis para armazenar os cálculos referentes
  late final CooperativaPageController _controller;
  late final double _economiaAnual;
  late final double _economiaMensal;

  @override
  void initState() {
    // Inicializando calculadora e realizando os cálculos.
    _controller = CooperativaPageController();
    _economiaAnual = _controller.calculadora
        .calculaDescontoAnual(widget.valorSlider, widget.cooperativa.desconto);

    _economiaMensal = _controller.calculadora
        .calculaDescontoMensal(widget.valorSlider, widget.cooperativa.desconto);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil.getScreenWidth(context),
        height: ScreenUtil.getScreenHeight(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.cooperativa.backgroundCooperative),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Cabeçalho (Logo da Cooperativa)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Hero(
                    tag: 'icon',
                    child: Image.asset(
                      widget.cooperativa.icon,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),

            // Corpo da página (contém a visualização dos dados)
            Container(
              height: ScreenUtil.getScreenHeight(context) / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.azul,
                    AppColors.azul.withOpacity(0.6),
                    AppColors.azul.withOpacity(0),
                  ],
                  stops: const [0.1, 0.8, 2],
                  begin: Alignment.bottomCenter,
                  end: AlignmentDirectional.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichTextWidget(
                      primeiraString: 'Veja a',
                      segundaString: 'economia!',
                      primeiroFontSize: 30,
                      primeiroColor: Colors.white,
                      segundoColor: Colors.green.shade500,
                      textAlign: TextAlign.start,
                      fontFamily: 'RobotoCondensed',
                    ),

                    // Agrupa dois '_infoEconomia'
                    FadeInUp(
                      duration: 800,
                      child: SizedBox(
                        child: Column(
                          children: [
                            // Widget que cria a visualização da informação
                            _infoEconomia(
                              'Economia Anual',
                              'assets/images/calendario-anual.png',
                              _economiaAnual,
                            ),

                            // Divisor
                            const Divider(color: Colors.yellow),

                            // Widget que cria a visualização da informação
                            _infoEconomia(
                              'Economia Mensal',
                              'assets/images/mensal.png',
                              _economiaMensal,
                            ),

                            // Divisor
                            const Divider(color: Colors.yellow),
                          ],
                        ),
                      ),
                    ),

                    // Roda pé (Botão contratar e Faça parte você também)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInUp(
                          duration: 1000,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.transparent),
                              elevation: MaterialStatePropertyAll(0.2),
                            ),
                            onPressed: () {
                              Get.to(
                                ParabensPage(nome: widget.cooperativa.nome),
                              );
                            },
                            child: const Text(
                              'CONTRATAR',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'RobotoCondensed',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        FadeInUp(
                          duration: 1200,
                          child: const RichTextWidget(
                            primeiraString: 'Faça parte',
                            segundaString: 'você também!',
                            primeiroFontSize: 30,
                            primeiroColor: Colors.white,
                            segundoColor: Colors.yellow,
                            textAlign: TextAlign.start,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para criar um "card" para as informações de economia
Widget _infoEconomia(String titulo, String imageAsset, double valor) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoCondensed",
            ),
          ),
          Image.asset(
            imageAsset,
            height: 40,
          )
        ],
      ),
      Row(
        children: [
          Text(
            FormatNumberUtil.formatarValor(valor),
            style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontFamily: 'RobotoCondensed',
                height: 1),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: CifraoWidget(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              color: Colors.green,
            ),
          ),
        ],
      ),
    ],
  );
}
