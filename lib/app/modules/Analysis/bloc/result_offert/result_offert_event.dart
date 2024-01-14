import '../../model/analysis.dart';
import '../../model/cooperative.dart';

abstract class ResultOffertEvent {}

class HandleCalcResultEvent extends ResultOffertEvent {
  Analysis analysis;
  Cooperative cooperative;
  HandleCalcResultEvent({required this.analysis, required this.cooperative});
}

class HandleAcceptOffertEvent extends ResultOffertEvent {
  HandleAcceptOffertEvent();
}
