abstract interface class IUsecase<S, F, P> {
  Future<(S success, F failure)> call(P param);
}
