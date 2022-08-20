import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'blocs/blocs.dart';

class CooperativeOfferView extends StatefulWidget {
  const CooperativeOfferView({Key? key}) : super(key: key);

  @override
  State<CooperativeOfferView> createState() => _CooperativeOfferViewState();
}

class _CooperativeOfferViewState extends State<CooperativeOfferView> {

  late final OfferBloc bloc;
  late final ArgumentsModel args;
  late final Size size;

  late final String savingsMonthly;
  late final String savingsYearly;
  late final String savingsPercentage;

  @override
  void initState() {
    super.initState();
    bloc = OfferBloc();
    bloc.add(OfferNormalEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)?.settings.arguments as ArgumentsModel;

    size = MediaQuery.of(context).size;

    final double savingsPercentageDouble =
          args.offer.savingsPercentage * 100;

      if (savingsPercentageDouble -
          savingsPercentageDouble.floor() > 0.01) {
        savingsPercentage =
            '''${savingsPercentageDouble.toStringAsFixed(2)}%''';
      } else {
        savingsPercentage =
            '''${savingsPercentageDouble.toStringAsFixed(0)}%''';
      }
      
      savingsMonthly = bloc.calculateSavingsMonthly(
          args.valueOfEnergyAcount, args.offer.savingsPercentage);
      
      savingsYearly = bloc.calculateSavingsYearly(
          args.valueOfEnergyAcount, args.offer.savingsPercentage);
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      child: BlocBuilder<OfferBloc, OfferState>(
        bloc: bloc,
        builder: (context, state) {

          if (state is OfferStateLoading) {
            SchedulerBinding.instance.addPostFrameCallback((_) async {
              bloc.showLoadingDialog(context);
              await Future.delayed(const Duration(seconds: 2));
              bloc.add(OfferNormalEvent());
              if (mounted) {
                bloc.closeLoadingDialog(context);
                SnackBarApp.showSnackBarApp(
                  context: context,
                  message: 'Cooperativa contratada!',
                  backgroundColor: Theme.of(
                    context
                  ).colorScheme.surfaceTint.withGreen(225),
                  isError: false,
                );
              }
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Oferta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.surfaceTint,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: args.offer.id ?? 0,
                    child: Image.asset(
                      Assets.handLight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                    child: Card(
                      surfaceTintColor: Theme.of(context).colorScheme.tertiary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, 
                          vertical: 20.0,
                        ),
                        child: SizedBox.expand(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.appLogo,
                                  width: size.width * 0.18,
                                  color: Theme.of(
                                    context
                                  ).colorScheme.primary.withAlpha(140),
                                ),
                                SizedBox(height: size.height * 0.0174),
                                Text(
                                  args.offer.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.0174),
                                AutoSizeText(
                                  'Economia de $savingsPercentage',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context
                                    ).colorScheme.surfaceTint,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                AutoSizeText(
                                  '''Atualmente você paga aproximadamente ${bloc.formatPrice(args.valueOfEnergyAcount)} por mês e ${bloc.formatPrice(args.valueOfEnergyAcount * 12)} por ano''',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(
                                      context
                                    ).colorScheme.error,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.02),
                                AutoSizeText(
                                  'Economize até  $savingsMonthly por mês',
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                AutoSizeText(
                                  'Economize até  $savingsYearly por ano',
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              child: ButtonAppWidget(
                isLoading: state is OfferStateLoading,
                onPressed: () async {
                  bloc.add(OfferLoadingEvent());
                },
                child: Text(
                  'Contratar',
                  style: TextStyle(
                    color: Theme.of(
                      context
                    ).colorScheme.tertiary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
}