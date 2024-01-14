import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wattio/app/controllers/cooperative_controller.dart';
import 'package:wattio/app/controllers/home_controller.dart';
import 'package:wattio/app/views/animations/fade_animation.dart';
import 'package:wattio/app/views/widgets/cifrao_widget.dart';
import 'package:wattio/app/views/widgets/header_widget.dart';
import 'package:wattio/app/views/widgets/rich_text_widget.dart';
import 'package:wattio/util/format_number_util.dart';
import 'package:wattio/util/screen_util.dart';
import 'package:wattio/util/theme/app_colors.dart';
import '../widgets/card_cooperativa_widget.dart';
import 'cooperative_page.dart';

/// Tela responsável pela visualização da tela home da aplicação.
/// @author Paulo Henrique Caserta

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declarando variáveis.
  late double _valorSlider;
  late final double _valorMaximoSlider;
  late final double _valorMinimoSlider;
  late final CooperativaController _cooperativaController;
  late final HomeController _controller;
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _valorSlider = 10000;
    _valorMaximoSlider = 100000;
    _valorMinimoSlider = 1000;

    // Iniciando o Page Controller
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) _currentPage = next;
    });

    // Inicializando o controlador de Cooperativas
    _cooperativaController = CooperativaController();

    // Inicializando repositório de Cooperativas
    _cooperativaController.inicializeRepository();

    // Inicializando o Controlador e passando a referência da data
    _controller = HomeController(_cooperativaController.data);

    super.initState();
  }

  @override
  void dispose() {
    // Dispose no controlador de página.
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFeceaec),
        body: SingleChildScrollView(
          child: Container(
            width: ScreenUtil.getScreenWidth(context),
            height: ScreenUtil.getScreenHeight(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.azul,
                  AppColors.azul.withOpacity(0),
                ],
                stops: const [0.3, 0.9],
                begin: Alignment.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabelhado da página: Nome e Logo Marca
                FadeInUp(duration: 800, child: const HeaderWidget()),

                // Corpo da página: entrada de dados com slider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Valor do slider juntamento com o cifrão
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                FormatNumberUtil.formatarValor(_valorSlider),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'RobotoCondensed',
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                              const CifraoWidget(
                                fontSize: 25,
                                fontFamily: 'RobotoCondensed',
                                color: Colors.white,
                              )
                            ],
                          ),

                          const Text(
                            "Seu custo\nmédio \nde Energia",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFf7ec00),
                            ),
                          ),
                        ],
                      ),

                      // Barra do Slider
                      Slider(
                        min: _valorMinimoSlider,
                        divisions: 100,
                        activeColor: Colors.white,
                        value: _valorSlider,
                        max: _valorMaximoSlider,
                        onChanged: (value) => setState(() {
                          _valorSlider = value;
                        }),
                      ),
                    ],
                  ),
                ),

                // Divisor
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: Divider(color: Colors.yellow),
                ),

                // "Soluções para você" e indicador de página
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInUp(
                        duration: 1000,
                        child: const RichTextWidget(
                          textAlign: TextAlign.start,
                          primeiraString: 'Soluções',
                          segundaString: 'para você',
                          primeiroFontSize: 25,
                          segundoFontSize: 30,
                          primeiroColor: Colors.white,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),

                      // Indicador de página
                      SmoothPageIndicator(
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.yellow,
                        ),
                        controller: _pageController,
                        count: _controller.data
                            .filtrarCooperativas(_valorSlider)
                            .length,
                      ),
                    ],
                  ),
                ),

                // Constrói os cards das Cooperativas na tela disponível
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _controller.data
                        .filtrarCooperativas(_valorSlider)
                        .length,
                    onPageChanged: (value) => setState(() {
                      _currentPage = value;
                    }),
                    itemBuilder: (context, index) {
                      // Filtra as Cooperativas com base no valor do Slider
                      final cooperativasFiltradas =
                          _controller.data.filtrarCooperativas(_valorSlider);

                      // Verifica se o index é igual à página atual (lógica para a animação do card funcionar)
                      bool paginaAtiva = index == _currentPage;

                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            CooperativaPage(
                              cooperativa: cooperativasFiltradas[index],
                              valorSlider: _valorSlider,
                            ),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: FadeInUp(
                          duration: 800,
                          child: CardCooperativa(
                            paginaAtiva: paginaAtiva,
                            cooperativa: cooperativasFiltradas[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
