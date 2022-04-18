import 'dart:convert';

import 'package:desafio/enum/person.dart';

class Plan {
  String name;
  int valueMinMonthly;
  int valueMaxMonthly;
  double discount;
  Person person;

  Plan({
    required this.name,
    required this.valueMinMonthly,
    required this.valueMaxMonthly,
    required this.discount,
    required this.person,
  });

  Plan copyWith({
    String? name,
    int? valueMinMonthly,
    int? valueMaxMonthly,
    double? discount,
    Person? person,
  }) {
    return Plan(
      name: name ?? this.name,
      valueMinMonthly: valueMinMonthly ?? this.valueMinMonthly,
      valueMaxMonthly: valueMaxMonthly ?? this.valueMaxMonthly,
      discount: discount ?? this.discount,
      person: person ?? this.person,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'valueMinMonthly': valueMinMonthly,
      'valueMaxMonthly': valueMaxMonthly,
      'discount': discount,
      'person': person.name,
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      name: map['name'],
      valueMinMonthly: map['valueMinMonthly']?.toInt(),
      valueMaxMonthly: map['valueMaxMonthly']?.toInt(),
      discount: map['discount']?.toDouble(),
      person: PersonFrom(map['person']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) => Plan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Plan(name: $name, valueMinMonthly: $valueMinMonthly, valueMaxMonthly: $valueMaxMonthly, discount: $discount, person: $person)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plan &&
        other.name == name &&
        other.valueMinMonthly == valueMinMonthly &&
        other.valueMaxMonthly == valueMaxMonthly &&
        other.discount == discount &&
        other.person == person;
  }

  @override
  int get hashCode {
    return name.hashCode ^ valueMinMonthly.hashCode ^ valueMaxMonthly.hashCode ^ discount.hashCode ^ person.hashCode;
  }
}
