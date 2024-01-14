// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../../shared/enum/property_type.dart';
import '../../../shared/util/brazilian_states.dart';

class Cooperative {
  String name;
  double economy;
  double maxMonthlyAmount;
  double minMonthlyAmount;
  List<State> states;
  List<PropertType> propertyTypes;

  Cooperative({
    required this.name,
    required this.economy,
    required this.maxMonthlyAmount,
    required this.minMonthlyAmount,
    required this.states,
    required this.propertyTypes,
  });

  @override
  String toString() {
    return 'Cooperative(name: $name, economy: $economy, maxMonthlyAmount: $maxMonthlyAmount, minMonthlyAmount: $minMonthlyAmount, states: $states, propertyTypes: $propertyTypes)';
  }

  @override
  bool operator ==(covariant Cooperative other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.economy == economy &&
      other.maxMonthlyAmount == maxMonthlyAmount &&
      other.minMonthlyAmount == minMonthlyAmount &&
      listEquals(other.states, states) &&
      listEquals(other.propertyTypes, propertyTypes);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      economy.hashCode ^
      maxMonthlyAmount.hashCode ^
      minMonthlyAmount.hashCode ^
      states.hashCode ^
      propertyTypes.hashCode;
  }
}
