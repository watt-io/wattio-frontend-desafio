import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/util/routes_app.dart';
import '../../../../shared/util/snackBarCustom/snackBarCustom.dart';
import '../../../../shared/util/theme/colors_app.dart';
import '../../../../shared/util/theme/imgs_app.dart';
import '../../../../shared/widget/app_bar/app_bar_custom.dart';
import '../../../../shared/widget/button/button_custom.dart';
import '../../../../shared/widget/lottie_custom/lottie_custom.dart';
import '../../bloc/choose_offert/choose_offert_bloc.dart';
import '../../bloc/choose_offert/choose_offert_event.dart';
import '../../bloc/choose_offert/choose_offert_state.dart';
import '../../model/analysis.dart';
import '../../model/cooperative.dart';
import '../../widget/card_offert.dart';

part 'choose_offert_methods.dart';

class ChooseOffertView extends StatefulWidget {
  final Analysis analysis;
  const ChooseOffertView({required this.analysis, super.key});

  @override
  State<ChooseOffertView> createState() => _ChooseOffertViewState();
}

class _ChooseOffertViewState extends State<ChooseOffertView> {
  @override
  void initState() {
    super.initState();

    _analysis = widget.analysis;

    _chooseOffertBloc = Modular.get();

    _chooseOffertBloc.add(HandleSearchOffertEvent(
      analysis: widget.analysis,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarCustom(buttonPagePop: true),
      body: Container(
        color: ColorsApp.white,
        width: double.infinity,
        child: BlocConsumer<ChooseOffertBloc, ChooseOffertState>(
          bloc: _chooseOffertBloc,
          listener: (context, state) {
            _chooseOffertBlocListener(
              context: context,
              state: state,
            );
          },
          builder: (context, state) {
            if (state is ChooseOffertLoadingState) {
              return const LottieCustom(lottieType: LottieType.loading);
            } else if (state is ChooseOffertSuccessState) {
              return _succsses(listCooperative: state.listCooperative);
            } else if (state is ChooseOffertNotFoundState) {
              return _empty(
                height: height,
                width: width,
                orientation: orientation,
              );
            } else if (state is ChooseOffertFailedState) {
              return const LottieCustom(lottieType: LottieType.failed);
            } else {
              return const LottieCustom(lottieType: LottieType.loading);
            }
          },
        ),
      ),
    );
  }
}
