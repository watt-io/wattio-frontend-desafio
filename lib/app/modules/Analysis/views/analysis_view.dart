import 'package:flutter/material.dart';

import '../../../shared/widget/app_bar/app_bar_custom.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({super.key});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: Center(
        child: Row(
          children: [
            Text('AnalysisView'),
          ],
        ),
      ),
    );
  }
}
