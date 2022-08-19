import 'package:flutter/material.dart';

class ButtonAppWidget extends StatelessWidget {
  const ButtonAppWidget({
    Key? key, 
    required this.isLoading, 
    required this.child,
    this.onPressed, 
  }) : super(key: key);
  final bool isLoading;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        primary: Theme.of(context).primaryColor,
        onPrimary: Theme.of(context).colorScheme.primary,
        onSurface: Theme.of(context).colorScheme.primary,
        enableFeedback: true,
        elevation: 2,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: isLoading
          ? null
          : onPressed,
      child: child,
    );
}