// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_plan_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreatePlanMobx on _CreatePlanMobxBase, Store {
  Computed<String?>? _$validateComputed;

  @override
  String? get validate =>
      (_$validateComputed ??= Computed<String?>(() => super.validate,
              name: '_CreatePlanMobxBase.validate'))
          .value;

  final _$nameAtom = Atom(name: '_CreatePlanMobxBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$valueMinMonthlyAtom =
      Atom(name: '_CreatePlanMobxBase.valueMinMonthly');

  @override
  double get valueMinMonthly {
    _$valueMinMonthlyAtom.reportRead();
    return super.valueMinMonthly;
  }

  @override
  set valueMinMonthly(double value) {
    _$valueMinMonthlyAtom.reportWrite(value, super.valueMinMonthly, () {
      super.valueMinMonthly = value;
    });
  }

  final _$valueMaxMonthlyAtom =
      Atom(name: '_CreatePlanMobxBase.valueMaxMonthly');

  @override
  double get valueMaxMonthly {
    _$valueMaxMonthlyAtom.reportRead();
    return super.valueMaxMonthly;
  }

  @override
  set valueMaxMonthly(double value) {
    _$valueMaxMonthlyAtom.reportWrite(value, super.valueMaxMonthly, () {
      super.valueMaxMonthly = value;
    });
  }

  final _$discountAtom = Atom(name: '_CreatePlanMobxBase.discount');

  @override
  double get discount {
    _$discountAtom.reportRead();
    return super.discount;
  }

  @override
  set discount(double value) {
    _$discountAtom.reportWrite(value, super.discount, () {
      super.discount = value;
    });
  }

  final _$personAtom = Atom(name: '_CreatePlanMobxBase.person');

  @override
  Person get person {
    _$personAtom.reportRead();
    return super.person;
  }

  @override
  set person(Person value) {
    _$personAtom.reportWrite(value, super.person, () {
      super.person = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_CreatePlanMobxBase.save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  @override
  String toString() {
    return '''
name: ${name},
valueMinMonthly: ${valueMinMonthly},
valueMaxMonthly: ${valueMaxMonthly},
discount: ${discount},
person: ${person},
validate: ${validate}
    ''';
  }
}
