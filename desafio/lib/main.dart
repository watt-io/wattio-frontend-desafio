import 'package:desafio/app/app_routes/app_pages.dart';
import 'package:desafio/app/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'wattio_desafio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      getPages: AppPages().routes,
      initialRoute: Routes.splash,
    );
  }
}
