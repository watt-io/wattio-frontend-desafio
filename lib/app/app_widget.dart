// ignore_for_file: deprecated_member_use

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_teste_wattio/app/shared/theme_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([asuka.asukaHeroController]);
    return MaterialApp.router(
      title: 'Energias Wattio',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeColor.buildThemeData(),
      builder: asuka.builder,
    );
  }
}
