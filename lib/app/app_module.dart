import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';
import 'shared/repository/repository.dart';
import 'shared/stores/cooperative_store.dart';

class AppModule extends Module {
  AppModule();
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Repository()),
        Bind.lazySingleton((i) => CooperativeStore(
              i.get(),
            )),

      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
