abstract class BlocState<T> {
  T? data;

  BlocState({required this.data});
}

class BlocStableState<T> extends BlocState<T> {
  BlocStableState({super.data});
}

class BlocEmptyState<T> extends BlocState<T> {
  BlocEmptyState({super.data});
}

class BlocErrorState<T> extends BlocState<T> {
  final String? failure;
  BlocErrorState(this.failure, {super.data});
}

class BlocLoadingState<T> extends BlocState<T> {
  BlocLoadingState({super.data});
}
