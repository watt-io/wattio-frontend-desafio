import 'dart:convert';

import 'package:desafio_wattio/models/cooperative_model.dart';
import 'package:flutter/services.dart';

class CooperativeRepository {
  final List<Cooperative> coperatives = [];

  Future<List<Cooperative>> loadCoperatives() async {
    String jsonString = await rootBundle
        .loadString('lib/services/cooperative.json');

    List<dynamic> jsonList = json.decode(jsonString)['cooperatives'];

    List<Cooperative> coperatives =
        jsonList.map((json) => Cooperative.fromJson(json)).toList();

    return coperatives;
  }
}
