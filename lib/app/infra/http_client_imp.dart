// ignore_for_file: unnecessary_lambdas

import 'package:dio/dio.dart' as dio;

import '../app.dart';
import '../models/response_model.dart';

class HttpClientImp implements HttpClient {

  final _dio = dio.Dio(
    dio.BaseOptions(
      baseUrl: apiDomain + apiBasePath,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiToken',
      },
    ),
  );

  @override
  Future<ResponseModel> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        body: response.data,
      );
    } on dio.DioError catch (e) {

      if (e.type == dio.DioErrorType.connectTimeout) {
        throw AppError.timeout;
      }
      
      else {
       throw AppError.api;
      }
    }
  }
}