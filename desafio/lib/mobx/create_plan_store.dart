import 'package:desafio/enum/person.dart';
import 'package:mobx/mobx.dart';
part 'create_plan_store.g.dart';

class CreatePlanMobx = _CreatePlanMobxBase with _$CreatePlanMobx;

abstract class _CreatePlanMobxBase with Store {
  @observable
  String? name;

  @observable
  double valueMinMonthly = 0;

  @observable
  double valueMaxMonthly = 0;

  @observable
  double discount = 0;

  @observable
  Person person = Person.legal;

  @action
  Future<void> save() async {}

  @computed
  String? get validate {
    return null;
  }
}
