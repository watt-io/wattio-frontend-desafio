import 'package:bloc/bloc.dart';

import '../../model/cooperative.dart';
import '../../service/analysis_service.dart';
import 'choose_offert_event.dart';
import 'choose_offert_state.dart';

class ChooseOffertBloc extends Bloc<ChooseOffertEvent, ChooseOffertState> {
  AnalysisService analysisService = AnalysisService();

  ChooseOffertBloc() : super(ChooseOffertInitialState()) {
    on<HandleSearchOffertEvent>((event, emit) async {
      try {
        emit(ChooseOffertLoadingState());

        await Future.delayed(const Duration(seconds: 3));

        List<Cooperative> listCooperative =
            analysisService.searchCooperative(analysis: event.analysis);

        if (listCooperative.isEmpty) {
          emit(ChooseOffertNotFoundState());
        } else {
          emit(ChooseOffertSuccessState(listCooperative: listCooperative));
        }
      } catch (e) {
        emit(ChooseOffertFailedState(message: 'Error no servidor'));
      }
    });
  }
}
