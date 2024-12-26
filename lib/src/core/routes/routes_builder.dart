import 'package:flutter/material.dart';
import 'package:frontend_wattio/src/core/routes/const_routes.dart';

import '../../features/home/presentation/view/home_view.dart';

class Routes {
  static build(ConstRoutes routes) {
    return <String, WidgetBuilder>{
      routes.homeView: (_) => const HomeView(),
    };
  }
}
