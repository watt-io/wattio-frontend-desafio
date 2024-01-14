import 'package:desafio/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonLoading extends StatelessWidget {
  final Function()? onTap;
  final bool? isLoading;
  final String? text;
  final Color? color;
  final Color? circularColor;
  final double? width;
  final double? height;
  const AppButtonLoading({
    super.key,
    this.onTap,
    this.isLoading = false,
    this.text = '',
    this.color = AppColors.white,
    this.circularColor = AppColors.white,
    this.width = 200,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color!,
          borderRadius: BorderRadius.circular(5),
        ),
        child: isLoading!
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(circularColor!),
                ),
              )
            : Center(
                child: Text(
                  text!,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
      ),
    );
  }
}
