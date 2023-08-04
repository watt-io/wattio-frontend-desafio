import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'todas_coops_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          '/outras-coops/:valueEnergy',
          child: (_, args) => TodasCoopsPage(
            valueEnergy: double.parse(args.params['valueEnergy']),
            cooperatives: args.data,
          ),
        ),
      ];
}
