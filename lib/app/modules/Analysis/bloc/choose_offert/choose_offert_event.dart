import '../../model/analysis.dart';

abstract class ChooseOffertEvent {}

class HandleSearchOffertEvent extends ChooseOffertEvent {
  Analysis analysis;
  HandleSearchOffertEvent({required this.analysis});
}
