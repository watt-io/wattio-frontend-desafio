import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'src/core/core.dart';

void main() {
  Injector.build();

  runApp(const SolarSavingsApplication());
}

class SolarSavingsApplication extends StatefulWidget {
  const SolarSavingsApplication({super.key});

  @override
  State<SolarSavingsApplication> createState() =>
      _SolarSavingsApplicationState();
}

class _SolarSavingsApplicationState extends State<SolarSavingsApplication> {
  late ConstRoutes routes;

  @override
  void initState() {
    routes = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: Routes.build(routes),
      initialRoute: routes.homeView,
    );
  }
}
