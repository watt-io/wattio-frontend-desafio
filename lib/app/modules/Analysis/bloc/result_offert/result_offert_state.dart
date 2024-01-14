import '../../model/result_offert.dart';

abstract class ResultOffertState {}

class ResultOffertInitialState extends ResultOffertState {
  ResultOffertInitialState() : super();
}

class ResultOffertLoadingState extends ResultOffertState {
  ResultOffertLoadingState() : super();
}

class ResultOffertNotFoundState extends ResultOffertState {
  ResultOffertNotFoundState() : super();
}

class ResultOffertSuccessState extends ResultOffertState {
  ResultOffert resultOffert;

  ResultOffertSuccessState({required this.resultOffert}) : super();
}

class ResultOffertcongratulationsState extends ResultOffertState {
  ResultOffertcongratulationsState() : super();
}

class ResultOffertFailedState extends ResultOffertState {
  String message;
  ResultOffertFailedState({required this.message}) : super();
}
