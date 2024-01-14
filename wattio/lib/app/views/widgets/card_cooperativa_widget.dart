import 'package:flutter/material.dart';
import 'package:wattio/app/controllers/card_controller.dart';
import 'package:wattio/app/models/model/cooperativo_model.dart';
import 'package:wattio/app/views/animations/fade_animation.dart';
import 'package:wattio/app/views/widgets/line_chart_widget.dart';
import 'package:wattio/util/screen_util.dart';

/// Widget responsável pela criação e visualização do card da Cooperativa.
/// @author Paulo Henrique Caserta

class CardCooperativa extends StatefulWidget {
  final Cooperativa cooperativa;
  final bool paginaAtiva;

  const CardCooperativa({
    super.key,
    required this.cooperativa,
    required this.paginaAtiva,
  });

  @override
  State<CardCooperativa> createState() => _CardCooperativaState();
}

class _CardCooperativaState extends State<CardCooperativa> {
  // Definindo controlador
  late CardController _controller;

  @override
  void initState() {
    // Inicializando o controlador
    _controller = CardController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Define a altura do card para criar o efeito de animação entre um card e outro
    final double top = widget.paginaAtiva ? 0 : 50;

    return Padding(
      padding: EdgeInsets.only(bottom: 50, right: 30, top: top),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: ScreenUtil.getScreenHeight(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(widget.cooperativa.backgroundCooperative),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Retorna os dois quadrados (Icone da Cooperativa e percentual)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Icone da Cooperativa
                      FadeInUp(
                        duration: 800,
                        child: Container(
                          width: (constraints.maxWidth / 2) - 5,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(0.1)
                            ], begin: Alignment.bottomCenter),
                          ),
                          child: Image.asset(widget.cooperativa.icon),
                        ),
                      ),

                      // Percentual econômico
                      FadeInUp(
                        duration: 1200,
                        child: Container(
                          width: (constraints.maxWidth / 2) - 5,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(0.1)
                            ], begin: Alignment.bottomCenter),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Cabeçalho do quandrado de percentual econômico
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/por-cento.png",
                                    height: 30,
                                  ),
                                  const Text(
                                    "Economia",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  )
                                ],
                              ),

                              // Agrupa o valor com o sinal de porcentagem
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${(widget.cooperativa.desconto * 100).truncate()}",
                                    style: const TextStyle(
                                      fontSize: 70,
                                      height: 1,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const Text(
                                    "%",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontFamily: "RobotoCondensed"),
                                  )
                                ],
                              ),

                              // Roda pé do quadrado do percentual econômico
                              const Text(
                                'Percentual que irá economizar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "RobotoCondensed",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Cria a visualização do texto mais o gráfico de linhas (quantidade de pessoas atendidas)
            Expanded(
              child: FadeInUp(
                duration: 1500,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff00303f).withOpacity(1),
                          const Color(0xff00303f).withOpacity(0.1)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'RobotoCondensed',
                                fontSize: 20,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Quantidade de pessoas\n',
                                ),
                                TextSpan(
                                  text: "atendidas pela nossa solução\n",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "nos últimos 5 anos",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff00303f).withOpacity(0.8),
                              ),
                              height: 50,
                              child: LineChartWidget(
                                points: _controller
                                    .inicializarPoints(widget.cooperativa),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
