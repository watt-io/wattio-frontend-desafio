import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/pages/home/components/audience_selector.dart';

void main() {
  testWidgets('AudienceSelector exibe botões e chama o callback corretamente', (WidgetTester tester) async {
    AudienceType? selectedAudience;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AudienceSelector(
            setAudienceType: (type) {
              selectedAudience = type;
            },
          ),
        ),
      ),
    );

    // Verifica se os dois botões aparecem
    expect(find.text('QUERO ECONOMIZAR EM CASA'), findsOneWidget);
    expect(find.text('QUERO ECONOMIZAR NA MINHA EMPRESA'), findsOneWidget);

    // Clica no botão da empresa
    await tester.tap(find.text('QUERO ECONOMIZAR NA MINHA EMPRESA'));
    await tester.pump(); // re-renderiza após o setState

    // Verifica se o callback foi chamado com AudienceType.pj
    expect(selectedAudience, AudienceType.pj);

    // Clica no botão da casa
    await tester.tap(find.text('QUERO ECONOMIZAR EM CASA'));
    await tester.pump();

    // Verifica se o callback foi chamado com AudienceType.pf
    expect(selectedAudience, AudienceType.pf);
  });
}
