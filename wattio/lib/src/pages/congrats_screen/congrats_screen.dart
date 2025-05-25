import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:wattio/src/pages/home/homepage.dart';
import 'package:wattio/src/utils/app_theme.dart';
import 'package:wattio/src/utils/custom_text_theme.dart';
import 'package:wattio/src/utils/screen_size.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({
    super.key,
    required this.chosenCooperative,
    required this.annualEconomy,
    required this.monthlyEconomy,
    this.isTesting = false,
  });

  final String chosenCooperative;
  final String annualEconomy;
  final String monthlyEconomy;
  final bool isTesting;

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  late ConfettiController _topCenter;
  late ConfettiController _topLeft;
  late ConfettiController _topRight;

  @override
  @override
  void initState() {
    super.initState();
    _topCenter = ConfettiController(duration: const Duration(seconds: 3));
    _topLeft = ConfettiController(duration: const Duration(seconds: 3));
    _topRight = ConfettiController(duration: const Duration(seconds: 3));

    if (!widget.isTesting) {
      Future.delayed(const Duration(seconds: 1), () {
        _topCenter.play();
        _topLeft.play();
        _topRight.play();
      });
    }
  }

  @override
  void dispose() {
    _topCenter.stop();
    _topLeft.stop();
    _topRight.stop();

    _topCenter.dispose();
    _topLeft.dispose();
    _topRight.dispose();
    super.dispose();
  }

  List<Color> get colors => [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: WattioColors.secondaryContainer),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: ScreenSize.width(context),
            height: ScreenSize.height(context),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text("🎉", style: TextStyle(fontSize: 28)),
                        AppText(
                          text: 'Parabéns pela Escolha!',
                          size: 32,
                          color: WattioColors.onTertiary,
                          weight: FontWeight.bold,
                          maxLines: 2,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 50),
                          child: AppText(
                            text:
                                'Com a ${widget.chosenCooperative} você pode economizar:',
                            maxLines: 4,
                            size: 22,
                            color: WattioColors.secondaryContainer,
                            weight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.money, color: WattioColors.onTertiary),
                            Flexible(
                              child: AppText(
                                text: '${widget.monthlyEconomy} por mês',
                                color: WattioColors.onTertiary,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: WattioColors.onTertiary,
                            ),
                            Flexible(
                              child: AppText(
                                text: '${widget.annualEconomy} por ano',
                                color: WattioColors.onTertiary,
                                size: 30,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: ScreenSize.width(context) / 1.1,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (_) => Homepage()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: AppText(text: 'Nova Simulação'),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Flexible(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              width: 150,
                              child: Image.asset(
                                'assets/icons/bottom_icon.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Confete do centro
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _topCenter,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.3,
              colors: colors,
              shouldLoop: false,
            ),
          ),

          // Confete do canto esquerdo
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _topLeft,
              blastDirection: pi / 4,
              // diagonal
              emissionFrequency: 0.05,
              numberOfParticles: 15,
              gravity: 0.3,
              colors: colors,
              shouldLoop: false,
            ),
          ),

          // Confete do canto direito
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _topRight,
              blastDirection: 3 * pi / 4,
              // diagonal oposta
              emissionFrequency: 0.05,
              numberOfParticles: 15,
              gravity: 0.3,
              colors: colors,
              shouldLoop: false,
            ),
          ),
        ],
      ),
    );
  }
}
