import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/app/features/home/blocs/blocs.dart';
import 'package:frontend/app/features/home/repository/home_repository.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  
  late final HomeBloc bloc;
  late final HomeRepository repository; 
  setUp(() {
    repository = HomeRepositoryMock();
    bloc = HomeBloc(repository: repository);
  });

  group('HomeView |', () {
    testWidgets('Should exist the widgets structure of the HomeView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeView(bloc: bloc),
        )
      );

      expect(find.text('Bem vindo ao '), findsOneWidget);
      expect(find.text('Marketplace de Energia'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.widgetWithIcon(TextFormField, Icons.price_change), findsOneWidget);
    });
  });
}