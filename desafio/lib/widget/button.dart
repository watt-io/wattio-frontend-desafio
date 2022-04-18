import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:desafio/enum/gradients.dart';

class Button extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color color;
  final Gradients? gradients;

  const Button({
    required this.width,
    required this.text,
    this.height = 60,
    this.color = Colors.black,
    this.gradients,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: color,
        gradient: gradients?.gradient,
        boxShadow: gradients == null
            ? null
            : [
                BoxShadow(
                  blurRadius: 22,
                  offset: const Offset(0, 18),
                  color: gradients!.color,
                  spreadRadius: -15,
                )
              ],
      ),
      child: Center(
        child: AutoSizeText(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
