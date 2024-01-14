import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'bloc/splash_screen_bloc.dart';
import 'views/splash_screen_view.dart';

class SplashScreenModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.singleton((i) => SplashScreenBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SplashScreenView(),
        ),
        WildcardRoute(child: (context, args) => const SplashScreenView())
      ];
}
