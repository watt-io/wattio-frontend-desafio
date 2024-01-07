import 'package:get_it/get_it.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/repository/offers_repository.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/usecase/get_offers_usecase.dart';
import 'package:wattio_frontend_desafio/modules/offers/external/datasource/offers_local_datasource.dart';
import 'package:wattio_frontend_desafio/modules/offers/infra/datasource/offers_datasource.dart';
import 'package:wattio_frontend_desafio/modules/offers/infra/repository/offers_local_repository.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/store/list_offers_store.dart';

class Inject {
  final _getIt = GetIt.I;

  void call() {
    _offersModule();
  }

  void _offersModule() {
    /// Datasources
    _getIt.registerLazySingleton<IOffersDatasource>(
        () => OffersLocalDatasource());

    /// Repositories
    _getIt.registerLazySingleton<IOffersRepository>(
        () => OffersLocalRepository(_getIt()));

    /// Usecases
    _getIt.registerLazySingleton<GetOffersUsecase>(
        () => GetOffersUsecase(_getIt()));

    /// Stores
    _getIt.registerLazySingleton<ListOffersStore>(
        () => ListOffersStore(_getIt()));

  }
}
