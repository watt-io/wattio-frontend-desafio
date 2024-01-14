
abstract class SplashScreenState {}

class SplashScreenInitialState extends SplashScreenState {}

class SplashScreenLoadingState extends SplashScreenState {}

class SplashScreenNotFoundState extends SplashScreenState {}

class SplashScreenSuccessState extends SplashScreenState {}

class SplashScreenFailedState extends SplashScreenState {
  String message;
  SplashScreenFailedState({required this.message}) : super();
}
