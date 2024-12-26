import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/core.dart';
import '../../home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    bloc.dispatchEvent(HomeEventOnReady());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocScreenBuilder(
      onEmpty: (state) => const SizedBox.shrink(),
      onError: (state) => HomeViewErrorState(state: state),
      onLoading: (state) => const HomeViewLoadingState(),
      onStable: (state) => HomeViewStableState(
        state: state,
        bloc: bloc,
      ),
      stream: bloc.state,
    );
  }
}
