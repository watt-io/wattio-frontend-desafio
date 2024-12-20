import 'package:flutter/material.dart';
import '../../modules/mobile/home/home_page_mobile.dart';
import '../../modules/mobile/proposal/proposal_page_mobile.dart';
import '../../modules/web/home/home_page_web.dart';
import 'animations/animated_elastic_out.dart';

class Routes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case '/HomePageMobile':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: const HomePageMobile(),
        );

      case '/HomePageWeb':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: const HomePageWeb(),
        );

      case '/ProposalPageMobile':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: ProposalPageMobile(
            desconto: (settings.arguments as Map)['desconto'] as double,
            nome: (settings.arguments as Map)['nome'] as String,
            valorMaximoMensal:
                (settings.arguments as Map)['valorMaximoMensal'] as int,
            valorMinimoMensal:
                (settings.arguments as Map)['valorMinimoMensal'] as int,
            value: (settings.arguments as Map)['value'] as double,
          ),
        );
    }
    return null;
  }
}
