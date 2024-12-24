import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'cooperative_store.g.dart';

class CooperativeStore = _CooperativeStore with _$CooperativeStore;

abstract class _CooperativeStore with Store {
  late final NumberFormat valueFormat;

  _CooperativeStore() {
    valueFormat = NumberFormat.currency(locale: 'pt-br', symbol: 'R\$');
  }

  @observable
  var coopSelec;

  @observable
  var valueSelec;

  @action
  setCoopSelec(value) => coopSelec = value;

  @action
  setValueSelec(value) => valueSelec = value;
}
