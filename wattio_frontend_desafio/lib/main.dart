import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wattio_frontend_desafio/screens/market_place.dart';
import 'package:wattio_frontend_desafio/services/cooperativa_services.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battle of Monsters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF10782E),
        textTheme: GoogleFonts.robotoTextTheme(),
        snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => CooperativaServices(),
        child: const MarketplacePage(),
      ),
    );
  }
}
