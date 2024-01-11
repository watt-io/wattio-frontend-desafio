import 'package:flutter_modular/flutter_modular.dart';

import 'views/analysis_view.dart';

class AnalysisModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const AnalysisView(),
        ),
        WildcardRoute(child: (context, args) => const AnalysisView())
      ];
}
