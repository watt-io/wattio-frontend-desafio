import 'package:flutter_modular/flutter_modular.dart';

import 'modules/Analysis/analysis_module.dart';
import 'shared/util/routes_app.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      RoutesApp.Analysis,
      module: AnalysisModule(),
    ),
  ];
}
