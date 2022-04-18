import 'package:flutter/material.dart';
import 'package:wattio_front/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const Scaffold(body: Home()),
      title: 'WATT.io: Marketplace de Energia',
    );
  }
}
