import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/pages/congrats_screen/congrats_screen.dart';
import 'package:wattio/src/pages/home/homepage.dart';

void main() {
  testWidgets('Exibe infos e navega ao clicar em Nova Simulação', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CongratsScreen(
          chosenCooperative: 'Cooperativa X',
          annualEconomy: 'R\$ 1200,00',
          monthlyEconomy: 'R\$ 100,00',
        ),
      ),
    );

    // Simula o tempo do Future.delayed do initState
    await tester.pump(Duration(seconds: 2));

    // Verifica se o texto aparece
    expect(find.text('Parabéns pela Escolha!'), findsOneWidget);

    await tester.tap(find.text('Nova Simulação'));
    await tester
        .pumpAndSettle(); // Só aqui, porque a navegação é síncrona depois do tap

    expect(find.byType(Homepage), findsOneWidget);
  });
}
