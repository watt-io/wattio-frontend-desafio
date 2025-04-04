import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/app/features/home/blocs/blocs.dart';
import 'package:frontend/app/features/home/repository/repository.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

class BuildContextMock extends Mock implements BuildContext {}

void main() {
  final repository = HomeRepositoryMock();

  late final OfferModel offer;

  late final HomeBloc bloc;

  setUpAll(() {
      offer = OfferModel(
        title: 'MockTitle', 
        minimumMonthlyAmount: 100, 
        maximumMonthlyAmount: 200, 
        savingsPercentage: 0.3
      );

      bloc = HomeBloc(repository: repository);
      
      bloc.valueOfEnergyAcount = 150.0;
  });

  group('Events |', () {
    test('The initial state must be OfferListStateInitial', () {
      expect(bloc.state, isA<OfferListStateInitial>());
    });

    test(
      'When adding the initial event '
      'must emit OfferListStateInitial', () {
      bloc.add(OfferListEventInitial());

      expect(bloc.stream, emits(isA<OfferListStateInitial>()));
    });
    
    test(
      'When adding the loading event '
      'must emit OfferListStateLoaded after OfferListStateLoading, '
      'with OfferModels in the offerList property', () async {
      
      when(() => repository.getOffers())
          .thenAnswer((_) async => <OfferModel>[offer, offer]
          );

      bloc.add(OfferListEventLoading());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OfferListStateLoading>(), 
          isA<OfferListStateLoaded>(), 
        ])
      );

      expect(bloc.state.offerList, allOf([
        isA<List<OfferModel>>(),
        isNotEmpty
      ]));
    });

    test(
      'When the getOffers method returns empty '
      'must emit OfferListStateEmpty after OfferListStateLoading, '
      'with empty offerList property', () async {
      
      when(() => repository.getOffers())
          .thenAnswer((_) async => <OfferModel>[]);

      bloc.add(OfferListEventLoading());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OfferListStateLoading>(), 
          isA<OfferListStateEmpty>(), 
        ])
      );

      expect(bloc.state.offerList, allOf([
        isA<List<OfferModel>>(),
        isEmpty
      ]));
    });

    test(
      'When the value inserted by the user is outside the ranges accepted by the offers '
      'must emit OfferListStateEmpty after OfferListStateLoading', () async {
      
      bloc.valueOfEnergyAcount = 20.0;
      
      when(() => repository.getOffers())
          .thenAnswer((_) async => <OfferModel>[offer, offer]
          );

      bloc.add(OfferListEventLoading());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OfferListStateLoading>(), 
          isA<OfferListStateEmpty>(), 
        ])
      );
    });

    test(
      'When catch an AppError.timeout '
      'must emit OfferListStateError after OfferListStateLoading, '
      'with the text [Verifique sua conexão com a internet]', () async {
      
      when(() => repository.getOffers())
          .thenAnswer((_) => throw AppError.timeout);

      bloc.add(OfferListEventLoading());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OfferListStateLoading>(), 
          isA<OfferListStateError>(), 
        ])
      );

      expect(bloc.state.error, equals('Verifique sua conexão com a internet'));
    });
    
    test(
      'When catch an AppError.api '
      'must emit OfferListStateError after OfferListStateLoading, '
      'with the text [Houve um erro na comunicação com o servidor]', () async {
      
      when(() => repository.getOffers())
          .thenAnswer((_) => throw AppError.api);

      bloc.add(OfferListEventLoading());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OfferListStateLoading>(), 
          isA<OfferListStateError>(), 
        ])
      );

      expect(bloc.state.error, equals('Houve um erro na comunicação com o servidor'));
    });

    test(
      'When catch an unmapped error '
      'must emit OfferListStateError after OfferListStateLoading, '
      'with the text [Ops, algo deu errado]', () async {
      
      when(() => repository.getOffers())
          .thenAnswer((_) => throw Exception('Unmapped Error'));

      bloc.add(OfferListEventLoading());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OfferListStateLoading>(), 
          isA<OfferListStateError>(), 
        ])
      );

      expect(bloc.state.error, equals('Ops, algo deu errado'));
    });
  });

  group('HomeBloc Methods |', () {

    setUp(() {
      bloc.valueOfEnergyAcount = 0.0;
    });

    testWidgets(
      '[increaseValue] must increment the valueOfEnergyAcount with the value parameter '
      'and must update the [valueController.text]', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {

            const String space = '\u{00A0}';

            for (var i = 0; i < 3; i++) {
              bloc.increaseValue(5, context);
            }

            expect(bloc.valueOfEnergyAcount, 15.0);
            expect(bloc.valueController.text, 'R\$${space}15,00');

            return const Placeholder();
          },
        ),
      );
    });

    testWidgets(
      '[decreaseValue] must decrement the valueOfEnergyAcount with the value parameter '
      'up to 0, and must update the [valueController.text]', (WidgetTester tester) async {

      bloc.valueOfEnergyAcount = 20.0;

      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {

            const String space = '\u{00A0}';

            for (var i = 0; i < 3; i++) {
              bloc.decreaseValue(5, context);
            }

            expect(bloc.valueOfEnergyAcount, 5.0);
            expect(bloc.valueController.text, 'R\$${space}5,00');

            for (var i = 0; i < 3; i++) {
              bloc.decreaseValue(5, context);
            }

            expect(bloc.valueOfEnergyAcount, 0.0);
            expect(bloc.valueController.text, 'R\$${space}0,00');

            return const Placeholder();
          },
        ),
      );
    });
  });
}
