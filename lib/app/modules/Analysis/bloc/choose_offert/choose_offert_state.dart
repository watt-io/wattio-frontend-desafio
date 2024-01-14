
import '../../model/cooperative.dart';

abstract class ChooseOffertState {}

class ChooseOffertInitialState extends ChooseOffertState {
  ChooseOffertInitialState() : super();
}

class ChooseOffertLoadingState extends ChooseOffertState {
  ChooseOffertLoadingState() : super();
}

class ChooseOffertNotFoundState extends ChooseOffertState {
  ChooseOffertNotFoundState() : super();
}

class ChooseOffertSuccessState extends ChooseOffertState {
  List<Cooperative> listCooperative;

  ChooseOffertSuccessState({required this.listCooperative}) : super();
}

class ChooseOffertFailedState extends ChooseOffertState {
  String message;
  ChooseOffertFailedState({required this.message}) : super();
}
