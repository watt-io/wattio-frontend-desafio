import 'package:desafio_wattio/global/theme_controller.dart';
import 'package:desafio_wattio/pages/cooperative/store/cooperative_store.dart';
import 'package:desafio_wattio/pages/marketplace/marketplace_page.dart';
import 'package:desafio_wattio/pages/marketplace/store/marketplace_store.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Theme Provider
      ListenableProvider<GlobalsThemeVar>(
        create: (context) => GlobalsThemeVar(),
      ),

      // Store
      Provider<MarketplaceStore>(
        create: (context) => MarketplaceStore(),
      ),

      Provider<CooperativeStore>(
        create: (context) => CooperativeStore(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences preferences;
  late GlobalsThemeVar globalsThemeVar;

  bool startPage = false;

  @override
  void didChangeDependencies() {
    if (!startPage) {
      globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

      _startPage();
    }

    super.didChangeDependencies();
  }

  Future _startPage() async {
    preferences = await SharedPreferences.getInstance();
    startPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace de Energia',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<GlobalsThemeVar>(context).currentThemeMode,
      debugShowCheckedModeBanner: false,
      home: const MarketplacePage(),
    );
  }
}
