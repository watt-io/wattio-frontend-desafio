import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class HomeViewErrorState extends StatefulWidget {
  final BlocState state;
  const HomeViewErrorState({required this.state, super.key});

  @override
  State<HomeViewErrorState> createState() => _HomeViewErrorStateState();
}

class _HomeViewErrorStateState extends State<HomeViewErrorState> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FilledButton(
            onPressed: () => bloc.dispatchEvent(HomeEventOnReady()),
            child: const Text('Tente Novamente')),
      ),
    );
  }
}
