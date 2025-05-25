import 'package:flutter/material.dart';
import 'package:wattio/src/utils/app_theme.dart';
import 'package:wattio/src/utils/custom_text_theme.dart';

Future<void> showFullScreenLoadingWithText(BuildContext context, String text) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.7),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: AppText(
                    text: text,
                    maxLines: 5,
                    color: WattioColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
