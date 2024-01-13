import 'package:flutter/material.dart';

/// A classe ScreenUtil fornece funções estáticas para facilitar o acesso às dimensões da tela.
/// Essa classe encapsula a lógica relacionada às dimensões da tela.
/// @author - Paulo Henrique Caserta

class ScreenUtil {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    return getScreenSize(context).width;
  }

  static double getScreenHeight(BuildContext context) {
    return getScreenSize(context).height;
  }
}
