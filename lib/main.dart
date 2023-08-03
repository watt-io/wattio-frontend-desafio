import 'dart:convert';

import 'package:energy_marketplace/pages/company_info_page.dart';
import 'package:energy_marketplace/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> readJsonFile() async {
  String jsonString = await rootBundle.loadString('assets/dummy_data.json');

  return jsonDecode(jsonString);
}

Map<String, dynamic> jsonMap = {};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  jsonMap = await readJsonFile();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: routes,
    );
  }

  final Map<String, WidgetBuilder> routes = {
    "/": (context) => const HomePage(),
    "/company_info_page": (context) => const CompanyInfoPage(),
  };
}
