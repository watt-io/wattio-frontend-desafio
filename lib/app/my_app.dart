import 'package:flutter/material.dart';

import 'app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Marktplace Energia',
      theme: CustomTheme.theme,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomeView(),
      },
      initialRoute: '/home',
    );
}