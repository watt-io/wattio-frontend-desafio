import 'package:flutter/material.dart';
import 'package:wattio/src/pages/home/homepage.dart';

import 'src/utils/app_theme.dart';
import 'src/utils/custom_text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wattio',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: WattioColors.primary),
        scaffoldBackgroundColor: WattioColors.primary,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: WattioColors.secondaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: WattioColors.surfaceTint),
      ),
      home: const Homepage(),
    );
  }
}
