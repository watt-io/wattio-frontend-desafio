import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/shared/util/routes_app.dart';

// import 'app/shared/util/routes_app.dart';

void main(List<String> args) async {
  Modular.setInitialRoute(
    '${RoutesApp.Splash_screen}/',
  );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
