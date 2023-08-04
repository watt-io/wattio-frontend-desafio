import 'package:flutter/material.dart';

class HomeViewLoadingState extends StatelessWidget {
  const HomeViewLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
