import 'dart:convert';
import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wattio_frontend_desafio/models/desconto.dart';
import 'package:wattio_frontend_desafio/models/cooperativa.dart';

class CooperativaServices extends ChangeNotifier {
  List<Cooperativa> _cooperativas = [];
  Cooperativa? _oferta;
  double? _valor = 0.0;

  Desconto? _desconto;

  UnmodifiableListView<Cooperativa> get coperativas =>
      UnmodifiableListView(_cooperativas);

  Future<List<Cooperativa>> getCooperativas() async {
    final response =
        await http.get(Uri.parse('${dotenv.env["API_URL"]}/cooperativas'));
    if (response.statusCode == 200) {
      late Iterable it;
      if (response.body is List<dynamic>) {
        Map<String, dynamic> results = json.decode(response.body);
        it = results['cooperativas'] as Iterable;
      } else {
        it = jsonDecode(response.body);
      }
      _cooperativas = List<Cooperativa>.from(
          it.map((cooperativa) => Cooperativa.fromJson(cooperativa)));
      notifyListeners();
      return _cooperativas;
    } else {
      throw Exception('Failed to load Cooperativas');
    }
  }

  Future<List<Cooperativa>> getCoopList() async {
    final response = await http.post(
        Uri.parse('${dotenv.env["API_URL"]}/coop_list'),
        body: {"valor": "$valor"});
    if (response.statusCode == 200) {
      late Iterable it;
      if (response.body is List<dynamic>) {
        Map<String, dynamic> results = json.decode(response.body);
        it = results['cooperativas'] as Iterable;
      } else {
        it = jsonDecode(response.body);
      }
      _cooperativas = List<Cooperativa>.from(
          it.map((cooperativa) => Cooperativa.fromJson(cooperativa)));
      notifyListeners();
      return _cooperativas;
    } else {
      throw Exception('Failed to load Cooperativas');
    }
  }

  Future<Desconto?> calculoDesconto() async {
    final calculo = await http.post(
      Uri.parse('${dotenv.env["API_URL"]}/desconto'),
      body: {
        "valorMensal": "$valor",
        "porcentagemDesconto": "${oferta?.desconto}",
      },
    );
    if (calculo.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(calculo.body);
      _desconto = Desconto.fromJson(jsonResponse);
      notifyListeners();
      return _desconto;
    } else {
      throw Exception('Failed to start battle');
    }
  }

  set oferta(Cooperativa? oferta) {
    _oferta = oferta;
    notifyListeners();
  }

  Cooperativa? get oferta => _oferta;

  set valor(double? valor) {
    _valor = valor;
    notifyListeners();
  }

  double? get valor => _valor;
}
