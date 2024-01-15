import 'dart:convert';
import 'package:flutter/services.dart';

class ApiService {
  static Future<List<dynamic>> fetchData(String fileName) async {
    try {
      String data = await rootBundle.loadString('assets/json/$fileName');
      return json.decode(data)['empresas'];
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}


