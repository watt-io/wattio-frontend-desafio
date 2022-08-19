import 'package:flutter/material.dart';

class SnackBarApp {

  static void showSnackBarApp(
    BuildContext context, 
    String message, 
    final bool isError
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: isError 
            ? Theme.of(context).colorScheme.error 
            : null,
      ),
    );
  }
}