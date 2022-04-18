import 'package:desafio/screen/home_screen.dart';
import 'package:desafio/screen/simulation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WATTio',
      initialRoute: HomeScreen.nameRoute,
      routes: {
        ...HomeScreen.route,
        ...SimulationScreen.route,
      },
    );
  }
}
