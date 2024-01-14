import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'model/analysis.dart';
import 'model/cooperative.dart';
import 'views/analysis_view.dart';
import '../../shared/util/routes_app.dart';
import 'bloc/choose_offert/choose_offert_bloc.dart';
import 'bloc/result_offert/result_offert_bloc.dart';
import 'views/choose_offert/choose_offert_view.dart';
import 'views/result_offert/result_offert_view.dart';

class AnalysisModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.singleton((i) => ChooseOffertBloc()),
        BlocBind.singleton((i) => ResultOffertBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const AnalysisView(),
        ),
        ChildRoute(
          RoutesApp.ChooseOffert,
          child: (context, args) => ChooseOffertView(
            analysis: args.data,
          ),
        ),
        ChildRoute(
          RoutesApp.ResultOffert,
          child: (context, args) => ResultOffertView(
            analysis: args.data['analysis'] as Analysis,
            cooperative: args.data['cooperative'] as Cooperative,
          ),
        ),
        WildcardRoute(child: (context, args) => const AnalysisView())
      ];
}
