import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/pages/home/homepage.dart';
import 'package:wattio/src/pages/medium_spending/monthly_medium_spending.dart';

void main() {
  testWidgets('Homepage UI and button navigation test', (WidgetTester tester) async {
    // Cria o widget para teste
    await tester.pumpWidget(
      MaterialApp(
        home: const Homepage(),
      ),
    );

    // Verifica se os textos principais estão na tela
    expect(find.text('Economize na sua conta de energia'), findsOneWidget);
    expect(find.text('Compare cooperativas da sua região!'), findsOneWidget);
    expect(find.text('Simular Economia'), findsOneWidget);

    // Toca no botão "Simular Economia"
    await tester.tap(find.text('Simular Economia'));
    await tester.pumpAndSettle(); // Espera pela navegação com animação

    // Verifica se a navegação foi para a tela correta
    expect(find.byType(MonthlyMediumSpending), findsOneWidget);
  });
}
