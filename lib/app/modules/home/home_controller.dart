import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../shared/stores/cooperative_store.dart';

class HomeController {
  final CooperativeStore __storeCooperative = Modular.get();
  final MoneyMaskedTextController _controller =
      MoneyMaskedTextController(leftSymbol: 'R\$ ');

  final RxNotifier<bool> _showSearch = RxNotifier(false);
  double valueEnergy = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  BoxConstraints? constraintsScreen;

  MoneyMaskedTextController get controller => _controller;
  CooperativeStore get storeCooperativa => __storeCooperative;
  bool get showSearch => _showSearch.value;
  GlobalKey<FormState> get formKey => _formKey;

  set showSearch(bool value) => _showSearch.value = value;
}
