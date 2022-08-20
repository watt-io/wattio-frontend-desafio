// ignore_for_file: unnecessary_lambdas

import 'dart:developer';

import 'package:dio/dio.dart' as dio;

import '../app.dart';

class HttpClientImp implements HttpClient {

  final _dio = dio.Dio(
    dio.BaseOptions(
      baseUrl: apiDomain + apiBasePath,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiToken',
      },
    ),
  );

  @override
  Future<Response> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return Response(
      statusCode: response.statusCode ?? 0,
      body: response.data,
    );
  }
}