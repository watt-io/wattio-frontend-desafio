import 'package:frontend_wattio/src/features/home/data/datasources/home_datasources.dart';
import 'package:frontend_wattio/src/core/routes/const_routes.dart';
import 'package:frontend_wattio/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:frontend_wattio/src/features/home/domain/repositories/home_repository.dart';
import 'package:frontend_wattio/src/features/home/domain/usecases/calculate_economy_usecase_impl.dart';
import 'package:frontend_wattio/src/features/home/domain/usecases/calculate_offers_usecase_impl.dart';
import 'package:frontend_wattio/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/remote/home_datasources_remote_impl.dart';

class Injector {
  static build() {
    GetIt getIt = GetIt.instance;

    // --> CORE

    getIt.registerLazySingleton(() => ConstRoutes());

    // --> DataSources

    getIt.registerLazySingleton<HomeDataSources>(
        () => HomeDataSourcesRemoteImpl());

    // --> Repositories

    getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt()));

    // --> UseCases

    getIt.registerLazySingleton(() => CalculateEconomyUseCaseImpl(getIt()));

    getIt.registerLazySingleton(() => CalculateOffersUseCaseImpl(getIt()));

    // --> BloC

    getIt.registerFactory(() => HomeBloc(getIt(), getIt()));
  }
}
