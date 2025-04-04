import 'package:flutter_modular/flutter_modular.dart';

import './splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
      ];
}
