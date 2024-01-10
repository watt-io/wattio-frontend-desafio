import 'package:energy_marketplace/pages/layouts/mobile_layout.dart';
import 'package:energy_marketplace/pages/layouts/web_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace de Energia'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 22.0,
                bottom: 22.0,
                top: 22.0,
              ),
              child: SingleChildScrollView(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;

                    if (isMobile) {
                      return const MobileLayout();
                    }

                    return const WebLayout();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
