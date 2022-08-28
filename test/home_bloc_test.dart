import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/app/features/home/blocs/blocs.dart';
import 'package:frontend/app/features/home/repository/repository.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

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
      'must emit OfferListStateLoading and OfferListStateLoaded in this exact order', () async {
      
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
    });

    test(
      'When the getOffers method returns empty '
      'must emit OfferListStateEmpty after OfferListStateLoading', () async {
      
      when(() => repository.getOffers())
          .thenAnswer((_) async => <OfferModel>[]
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
      'must emit OfferListStateError after OfferListStateLoading'
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
      'must emit OfferListStateError after OfferListStateLoading'
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
      'must emit OfferListStateError after OfferListStateLoading'
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
}