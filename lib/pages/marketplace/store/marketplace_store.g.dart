// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MarketplaceStore on _MarketplaceStore, Store {
  late final _$valueAtom =
      Atom(name: '_MarketplaceStore.value', context: context);

  @override
  double? get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double? value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$cooperativesAtom =
      Atom(name: '_MarketplaceStore.cooperatives', context: context);

  @override
  ObservableList<Cooperative> get cooperatives {
    _$cooperativesAtom.reportRead();
    return super.cooperatives;
  }

  @override
  set cooperatives(ObservableList<Cooperative> value) {
    _$cooperativesAtom.reportWrite(value, super.cooperatives, () {
      super.cooperatives = value;
    });
  }

  late final _$offersAtom =
      Atom(name: '_MarketplaceStore.offers', context: context);

  @override
  ObservableList<Cooperative> get offers {
    _$offersAtom.reportRead();
    return super.offers;
  }

  @override
  set offers(ObservableList<Cooperative> value) {
    _$offersAtom.reportWrite(value, super.offers, () {
      super.offers = value;
    });
  }

  late final _$offersVisibleFlagAtom =
      Atom(name: '_MarketplaceStore.offersVisibleFlag', context: context);

  @override
  bool get offersVisibleFlag {
    _$offersVisibleFlagAtom.reportRead();
    return super.offersVisibleFlag;
  }

  @override
  set offersVisibleFlag(bool value) {
    _$offersVisibleFlagAtom.reportWrite(value, super.offersVisibleFlag, () {
      super.offersVisibleFlag = value;
    });
  }

  late final _$loadCooperativesAsyncAction =
      AsyncAction('_MarketplaceStore.loadCooperatives', context: context);

  @override
  Future<void> loadCooperatives() {
    return _$loadCooperativesAsyncAction.run(() => super.loadCooperatives());
  }

  late final _$_MarketplaceStoreActionController =
      ActionController(name: '_MarketplaceStore', context: context);

  @override
  void formChanged(dynamic valueChange) {
    final _$actionInfo = _$_MarketplaceStoreActionController.startAction(
        name: '_MarketplaceStore.formChanged');
    try {
      return super.formChanged(valueChange);
    } finally {
      _$_MarketplaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateOffers() {
    final _$actionInfo = _$_MarketplaceStoreActionController.startAction(
        name: '_MarketplaceStore.updateOffers');
    try {
      return super.updateOffers();
    } finally {
      _$_MarketplaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleOffersVisibleFlag() {
    final _$actionInfo = _$_MarketplaceStoreActionController.startAction(
        name: '_MarketplaceStore.toggleOffersVisibleFlag');
    try {
      return super.toggleOffersVisibleFlag();
    } finally {
      _$_MarketplaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
cooperatives: ${cooperatives},
offers: ${offers},
offersVisibleFlag: ${offersVisibleFlag}
    ''';
  }
}
