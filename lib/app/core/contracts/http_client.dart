abstract class HttpClient {
  Future<Response> get(String endpoint);
}

class Response {
  Response({required this.statusCode, this.body});
  final int statusCode;
  final Map<String, dynamic>? body;

  bool get isOk => statusCode >= 200 && statusCode < 300;
}