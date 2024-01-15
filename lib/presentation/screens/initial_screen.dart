import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Marketplace de Energia", style: TextStyle(fontSize: 24)),
        Image.asset("assets/images/consumo-de-energia.png")
      ],
    ));
  }
}
