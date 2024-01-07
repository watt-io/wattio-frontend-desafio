abstract base class Exception {
  final StackTrace stackTrace;
  final Object exception;
  final String message;

  Exception({
    required this.message,
    required this.stackTrace,
    required this.exception,
  });
}
