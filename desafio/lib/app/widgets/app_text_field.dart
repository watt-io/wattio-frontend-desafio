import 'package:desafio/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.formatters,
    this.cursorColor = Colors.black,
    this.validator,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.isEnable = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefix,
    this.sulfix,
    this.maxLines,
    this.fillColor,
    this.boderColor,
    this.obscureText = false,
    this.textAlign,
  });

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? formatters;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final bool isEnable;
  final Function(String)? onChanged;
  void Function(String)? onFieldSubmitted;
  final Widget? prefix;
  final Widget? sulfix;
  final int? maxLines;
  final Color? fillColor;
  final Color? boderColor;
  final bool obscureText;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: formatters,
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      controller: controller,
      cursorColor: cursorColor,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      enabled: isEnable,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: boderColor ?? Colors.transparent, width: 1.0),
        ),
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.black, fontSize: 14),
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.black, fontSize: 14),
        prefix: prefix,
        suffix: sulfix,
      ),
      textAlign: textAlign ?? TextAlign.start,
      style: const TextStyle(color: AppColors.black),
    );
  }
}
