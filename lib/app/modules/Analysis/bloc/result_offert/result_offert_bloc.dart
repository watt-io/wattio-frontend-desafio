import 'package:bloc/bloc.dart';
import 'package:wattio_frontend_desafio_offkevyn/app/modules/Analysis/model/result_offert.dart';

import '../../service/analysis_service.dart';
import 'result_offert_event.dart';
import 'result_offert_state.dart';

class ResultOffertBloc extends Bloc<ResultOffertEvent, ResultOffertState> {
  AnalysisService analysisService = AnalysisService();

  ResultOffertBloc() : super(ResultOffertInitialState()) {
    on<HandleCalcResultEvent>((event, emit) async {
      try {
        emit(ResultOffertLoadingState());

        await Future.delayed(const Duration(seconds: 3));

        ResultOffert resultOffert = analysisService.calcResult(
            analysis: event.analysis, cooperative: event.cooperative);

        emit(ResultOffertSuccessState(resultOffert: resultOffert));
      } catch (e) {
        emit(ResultOffertFailedState(message: 'Error no servidor'));
      }
    });

    on<HandleAcceptOffertEvent>((event, emit) async {
      try {
        emit(ResultOffertLoadingState());

        await Future.delayed(const Duration(seconds: 2));

        emit(ResultOffertcongratulationsState());
      } catch (e) {
        emit(ResultOffertFailedState(message: 'Error no servidor'));
      }
    });
  }
}
