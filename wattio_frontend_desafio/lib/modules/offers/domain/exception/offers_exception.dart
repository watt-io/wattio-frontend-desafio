import 'package:wattio_frontend_desafio/shared/exception/exception.dart';

sealed class OffersException extends Exception {
  OffersException({
    required super.message,
    required super.stackTrace,
    required super.exception,
  });

  factory OffersException.unknow(StackTrace s, Object e) {
    return OffersUnknowException(
      message: "Erro desconhecido",
      stackTrace: s,
      exception: e,
    );
  }
}

final class OffersUnknowException extends OffersException {
  OffersUnknowException({
    required super.message,
    required super.stackTrace,
    required super.exception,
  });
}
