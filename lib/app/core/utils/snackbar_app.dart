import 'package:flutter/material.dart';

class SnackBarApp {
  static void showSnackBarApp({
    required BuildContext context, 
    required String message, 
    final bool isError = false,
    final Color? backgroundColor
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: isError 
            ? Theme.of(context).colorScheme.error 
            : backgroundColor,
      ),
    );
  }
}