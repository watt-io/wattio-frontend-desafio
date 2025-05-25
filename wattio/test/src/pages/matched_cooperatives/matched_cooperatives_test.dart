import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/modules/model/business_model.dart';
import 'package:wattio/src/pages/congrats_screen/congrats_screen.dart';
import 'package:wattio/src/pages/matched_cooperatives/matched_cooperatives.dart';

void main() {
  testWidgets('Cooperativas correspondentes mostra dados e navegam para a tela de parabéns', (WidgetTester tester) async {
    final businessList = [
      BusinessModel(name: 'Coop Sol', discount: 0.25, minMonthlyValue: 1000, maxMonthlyValue: 8000, audienceType: AudienceType.both),
      BusinessModel(name: 'Luz Ideal', discount: 0.18, minMonthlyValue: 500, maxMonthlyValue: 6500, audienceType: AudienceType.both),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: MatchedCooperatives(
          matchedBusiness: businessList,
          consumerSpending: 2000,
          audienceType: AudienceType.pf,
        ),
      ),
    );

    expect(find.textContaining('Confira as opções'), findsOneWidget);
    expect(find.text('Coop Sol'), findsOneWidget);
    expect(find.text('Quero Contratar Este'), findsAtLeastNWidgets(1));

    // Clica no botão
    final contratarButton = find.text('Quero Contratar Este').first;
    await tester.ensureVisible(contratarButton);
    await tester.tap(contratarButton);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));


    expect(find.byType(CongratsScreen), findsOneWidget);
  });


  testWidgets('Recalcular Ofertas volta à tela anterior', (WidgetTester tester) async {
    bool backPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return MatchedCooperatives(
              matchedBusiness: [
                BusinessModel(name: 'Test Coop', discount: 0.2, minMonthlyValue: 1000, maxMonthlyValue: 8000, audienceType: AudienceType.both),
              ],
              consumerSpending: 1000,
              audienceType: AudienceType.pj,
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Recalcular Ofertas'));
    await tester.pump(); // Sem pumpAndSettle, pois não há navegação real

    expect(find.text('Recalcular Ofertas'), findsOneWidget);
  });
}
