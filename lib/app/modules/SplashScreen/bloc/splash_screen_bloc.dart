import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/util/routes_app.dart';
import 'splash_screen_events.dart';
import 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvents, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitialState()) {
    on<OnLoadingEvent>((event, emit) async {
      try {
        emit(SplashScreenLoadingState());

        await Future.delayed(const Duration(seconds: 2));


          Modular.to.navigate(
            '${RoutesApp.Analysis}/',
          );


        emit(SplashScreenSuccessState());
      } catch (e) {
        emit(SplashScreenFailedState(message: "Erro no servidor"));
      }
    });
  }
}
