import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/screen/list_offers_screen.dart';
import 'package:wattio_frontend_desafio/shared/inject/inject.dart';
import 'package:wattio_frontend_desafio/shared/theme/theme.dart';

void main() {
  Inject()();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme()(context),
      home: const ListOffersScreen(),
    );
  }
}
