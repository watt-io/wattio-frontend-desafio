import 'package:flutter/material.dart';

import '../../../core/core.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key, 
    this.sideHeght
  }) : super(key: key);
  final double? sideHeght;

  @override
  Widget build(BuildContext context) => Center(
      child: Image(
        width: sideHeght,
        image: const AssetImage(
          Assets.voidState,
        ),
      ),
    );
}