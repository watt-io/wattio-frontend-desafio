import 'package:flutter/material.dart';

import 'app.dart';
import 'features/cooperative_offer/cooperative_offer_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Marktplace Energia',
      theme: CustomTheme.theme,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomeView(),
        '/cooperative_offer': (BuildContext context) => const CooperativeOfferView(),
      },
      initialRoute: '/home',
    );
}