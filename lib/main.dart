import 'package:desafio_front_end_wattio/presentation/providers/screens/splash_screen.dart';
import 'package:desafio_front_end_wattio/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/cooperativa_provider.dart';

void main() {
  runApp(
    // Aqui faco o uso do MultiProvider para utilizar varios providers, caso seja necessario.
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CooperativaProvider())],
      child: const WattioApp(),
    ),
  );
}

class WattioApp extends StatelessWidget {
  const WattioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wattio',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
