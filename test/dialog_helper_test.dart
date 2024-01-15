import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wattio_test/presentation/widgets/dialog_helper.dart';


void main() {
  testWidgets('DialogHelper showSavingsDialog test', (WidgetTester tester) async {
    final TextEditingController gastoMensalController = TextEditingController();
    gastoMensalController.text = '1000';

    final Map<String, dynamic> oferta = {'desconto': 10};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () => DialogHelper.showSavingsDialog(context, oferta, gastoMensalController),
                child: const Text('Show Dialog'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Economia Mensal: R\$100.00'), findsOneWidget);
    expect(find.text('Economia Anual: R\$1200.00'), findsOneWidget);
  });
}
