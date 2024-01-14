import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SnackBarCustom extends SnackBar {
  SnackBarCustom({
    super.key,
    required String title,
    required String message,
    required ContentType contentType,
  }) : super(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: contentType,
          ),
        );
}
