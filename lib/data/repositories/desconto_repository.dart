import 'package:wattio_test/data/repositories/api_service.dart.dart';

class DescontoRepository {
  Future<List<Map<String, dynamic>>> fetchDescontos(String tipoCliente) async {
    try {
      String fileName = tipoCliente == 'PF'
          ? 'descontos_pf_empresas.json'
          : 'descontos_pj_empresas.json';

      List<dynamic> data = await ApiService.fetchData(fileName);

      if (data.every((element) => element is Map<String, dynamic>)) {
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Invalid data format');
      }
    } catch (error) {
      throw Exception('Failed to load descontos: $error');
    }
  }
}

