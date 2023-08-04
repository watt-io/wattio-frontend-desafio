import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecoratedTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? label;
  const DecoratedTextField(
      {required this.controller,
      required this.label,
      required this.keyboardType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[,.]')),
        FilteringTextInputFormatter.digitsOnly
      ],
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
