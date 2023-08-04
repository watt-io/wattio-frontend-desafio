import 'package:flutter/material.dart';
import 'package:projeto_teste_wattio/app/shared/theme_colors.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? colorButtom;
  final Color? colorText;
  final double? height;
  final double? width;
  final double marginHorizontal;
  final double borderRadius;

  const ButtonDefault(
      {required this.text,
      required this.onPressed,
      this.colorButtom = ThemeColor.darkColor,
      Key? key,
      this.height = 50,
      this.width = 200,
      this.colorText = Colors.white,
      this.marginHorizontal = 16,
      this.borderRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor: colorButtom,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: marginHorizontal,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: colorText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
