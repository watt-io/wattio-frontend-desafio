import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'src/shared/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wattio app',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.routes,
      initialRoute: kIsWeb ? '/HomePageWeb' : '/HomePageMobile',
    );
  }
}
