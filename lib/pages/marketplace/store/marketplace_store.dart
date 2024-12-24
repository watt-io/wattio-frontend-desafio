import 'dart:developer';

import 'package:desafio_wattio/models/cooperative_model.dart';
import 'package:desafio_wattio/services/cooperative_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'marketplace_store.g.dart';

class MarketplaceStore = _MarketplaceStore with _$MarketplaceStore;

abstract class _MarketplaceStore with Store {
  final double valueMin = 1000.0;
  final double valueMax = 100000.0;

  final CooperativeRepository _cooperativeRepository = CooperativeRepository();

  late final TextEditingController valueController;
  late final NumberFormat valueFormat;

  _MarketplaceStore() {
    valueFormat = NumberFormat.currency(locale: 'pt-br', symbol: 'R\$');
    valueController = TextEditingController(text: valueFormat.format(valueMin));
    value = valueMin;
    loadCooperatives();
  }

  @observable
  double? value;

  @observable
  ObservableList<Cooperative> cooperatives = ObservableList<Cooperative>();

  @observable
  ObservableList<Cooperative> offers = ObservableList<Cooperative>();

  @observable
  bool offersVisibleFlag = false;

  @action
  Future<void> loadCooperatives() async {
    cooperatives =
        ObservableList.of(await _cooperativeRepository.loadCoperatives());
  }

  @action
  void formChanged(valueChange) {
    try {
      var valueToCheck = valueFormat.parse(valueChange);

      if (valueToCheck < valueMin) {
        value = valueMin;
        valueController.text = valueFormat.format(valueMin);
      } else {
        value = valueToCheck.toDouble();
        valueController.text = valueFormat.format(valueToCheck);
      }
    } catch (e) {
      log('ERRO AO ATUALIZAR O FORMS >>> $e');
    }
  }

  @action
  void updateOffers() {
    try {
      List<Cooperative> auxList = [];

      for (var coop in cooperatives) {
        if (value! >= coop.valorMinimoMensal! &&
            value! <= coop.valorMaximoMensal!) {
          auxList.add(coop);
        }
      }

      offers = ObservableList.of(auxList);
    } catch (e) {
      log('ERRO AO OBTER OFERTAS >>> $e');
    }
  }

  @action
  void toggleOffersVisibleFlag() {
    if (!offersVisibleFlag) {
      offersVisibleFlag = true;
    }
  }
}
