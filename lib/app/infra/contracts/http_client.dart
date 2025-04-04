import '../../models/response_model.dart';

abstract class HttpClient {
  Future<ResponseModel> get(String endpoint);
}