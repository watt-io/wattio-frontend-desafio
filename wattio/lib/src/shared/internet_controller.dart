import 'package:flutter/widgets.dart';

class InternetController {
  static final ValueNotifier<bool> isInternetOn = ValueNotifier<bool>(true);

  static void changeStateInternet(bool value) =>
      isInternetOn.value = !isInternetOn.value;
}
