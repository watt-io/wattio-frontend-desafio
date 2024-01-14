import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/util/routes_app.dart';
import '../../../../shared/util/snackBarCustom/snackBarCustom.dart';
import '../../../../shared/util/theme/colors_app.dart';
import '../../../../shared/util/theme/imgs_app.dart';
import '../../../../shared/widget/app_bar/app_bar_custom.dart';
import '../../../../shared/widget/button/button_custom.dart';
import '../../../../shared/widget/lottie_custom/lottie_custom.dart';
import '../../bloc/result_offert/result_offert_bloc.dart';
import '../../bloc/result_offert/result_offert_event.dart';
import '../../bloc/result_offert/result_offert_state.dart';
import '../../model/analysis.dart';
import '../../model/cooperative.dart';
import '../../model/result_offert.dart';
import '../../widget/card_offert.dart';

part 'result_offert_methods.dart';

class ResultOffertView extends StatefulWidget {
  final Analysis analysis;
  final Cooperative cooperative;

  const ResultOffertView({
    required this.analysis,
    required this.cooperative,
    super.key,
  });

  @override
  State<ResultOffertView> createState() => _ResultOffertViewState();
}

class _ResultOffertViewState extends State<ResultOffertView> {
  @override
  void initState() {
    super.initState();

    _resultOffertBloc = Modular.get();

    _resultOffertBloc.add(HandleCalcResultEvent(
      analysis: widget.analysis,
      cooperative: widget.cooperative,
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
        child: BlocConsumer<ResultOffertBloc, ResultOffertState>(
          bloc: _resultOffertBloc,
          listener: (context, state) {
            _resultOffertBlocListener(
              context: context,
              state: state,
            );
          },
          builder: (context, state) {
            if (state is ResultOffertLoadingState) {
              return const LottieCustom(lottieType: LottieType.loading);
            } else if (state is ResultOffertSuccessState) {
              return _succsses(resultOffert: state.resultOffert);
            } else if (state is ResultOffertcongratulationsState) {
              return _congratulations(
                orientation: orientation,
                height: height,
                width: width,
              );
            } else if (state is ResultOffertNotFoundState) {
              return const LottieCustom(lottieType: LottieType.empty);
            } else if (state is ResultOffertFailedState) {
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
