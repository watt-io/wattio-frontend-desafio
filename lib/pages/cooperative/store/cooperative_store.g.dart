// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooperative_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CooperativeStore on _CooperativeStore, Store {
  late final _$coopSelecAtom =
      Atom(name: '_CooperativeStore.coopSelec', context: context);

  @override
  dynamic get coopSelec {
    _$coopSelecAtom.reportRead();
    return super.coopSelec;
  }

  @override
  set coopSelec(dynamic value) {
    _$coopSelecAtom.reportWrite(value, super.coopSelec, () {
      super.coopSelec = value;
    });
  }

  late final _$valueSelecAtom =
      Atom(name: '_CooperativeStore.valueSelec', context: context);

  @override
  dynamic get valueSelec {
    _$valueSelecAtom.reportRead();
    return super.valueSelec;
  }

  @override
  set valueSelec(dynamic value) {
    _$valueSelecAtom.reportWrite(value, super.valueSelec, () {
      super.valueSelec = value;
    });
  }

  late final _$_CooperativeStoreActionController =
      ActionController(name: '_CooperativeStore', context: context);

  @override
  dynamic setCoopSelec(dynamic value) {
    final _$actionInfo = _$_CooperativeStoreActionController.startAction(
        name: '_CooperativeStore.setCoopSelec');
    try {
      return super.setCoopSelec(value);
    } finally {
      _$_CooperativeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValueSelec(dynamic value) {
    final _$actionInfo = _$_CooperativeStoreActionController.startAction(
        name: '_CooperativeStore.setValueSelec');
    try {
      return super.setValueSelec(value);
    } finally {
      _$_CooperativeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coopSelec: ${coopSelec},
valueSelec: ${valueSelec}
    ''';
  }
}
