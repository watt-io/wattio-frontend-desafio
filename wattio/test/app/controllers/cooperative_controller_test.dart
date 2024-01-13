import 'package:flutter_test/flutter_test.dart';
import 'package:wattio/app/controllers/cooperative_controller.dart';

void main() {
  group('inicialização do repositório', () {
    test('deve mostrar true se o data foi inicializado no repositório', () {
      final cooperativaController = CooperativaController();

      cooperativaController.inicializeRepository();

      expect(cooperativaController.data.cooperativas.isNotEmpty, true);
    });
  });
  testWidgets('cooperative controller ...', (tester) async {});
}
