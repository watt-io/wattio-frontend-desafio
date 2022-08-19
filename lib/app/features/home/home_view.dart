// ignore_for_file: depend_on_referenced_packages

import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'blocs/blocs.dart';
import 'widgets/widgets.dart';

class HomeView extends StatefulWidget  {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final currencyFormatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    name: 'R\$',
  );

  final TextEditingController valueController = TextEditingController();

  late final OfferListBloc bloc;

  double valueOfEnergyAcount = 0.0;
  
  @override
  void initState() {
    super.initState();
    bloc = OfferListBloc();
    bloc.inputOfferList.add(OfferListInitialEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.inputOfferList.close();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.appLogo,
                          height: 60.0,
                          color: Theme.of(
                            context
                          ).colorScheme.onBackground.withAlpha(200),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Bem vindo ao ',
                              style: Theme.of(
                                context
                              ).textTheme.headline6?.copyWith(     
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Marketplace de Energia',
                              style: Theme.of(
                                  context).textTheme.headline5?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  Text(
                    '''Busque por cooperativas de energia que atendam a sua necessidade.''',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(
                          context
                        ).textTheme.bodyText1?.color?.withAlpha(180),
                      ),
                  ),
                  const SizedBox(height: 16.0),
                  Card(
                    surfaceTintColor: Theme.of(context).colorScheme.tertiary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, 
                        vertical: 20.0,
                      ),
                      child: Column(
                        children: [
                          AutoSizeText(
                            'Insira o valor médio da sua conta de energia',
                            style: Theme.of(context).textTheme.headline6,
                            maxFontSize: 16,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: TextFieldWidget(
                                  hint: 'Ex: R\$ 1000,00',
                                  inputFormatters: [currencyFormatter],
                                  prefix: const Icon(Icons.price_change),
                                  controller: valueController,
                                  textInputType: TextInputType.number,
                                  onChanged: (value) {
                                    valueOfEnergyAcount = 
                                        currencyFormatter
                                        .getUnformattedValue()
                                        .toDouble();
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              ButtonGroupChangeValueWidget(
                                onIncrease: _increaseValue,
                                onDecreasing: _decreasingValue,
                              )
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          StreamBuilder<OfferListState>(
                            stream: bloc.stream,
                            builder: (context, snapshot) => ButtonAppWidget(
                                isLoading: false,
                                onPressed: () {
                                  if(valueController.text.isNotEmpty) {
                                    bloc.inputOfferList
                                        .add(OfferListLoadingEvent());
                                  }
                                },
                                child: Text(
                                  'Buscar ofertas',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  ],
                ),
                Expanded(
                  child: StreamBuilder<OfferListState>(
                    stream: bloc.stream,
                    builder: (context, snapshot) {
                      final state = snapshot.data?.state;
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          if (state == OfferListStateEnum.initial) {
                            return Center(
                              child: InitialStateWidget(
                              sideHeght: 
                                constraints.maxHeight > constraints.maxWidth
                                    ? constraints.maxWidth * 0.8
                                    : constraints.maxHeight * 0.8,
                          ),
                            );
                  
                          } else if (state == OfferListStateEnum.empty)  {
                            return Center(
                              child: VoidStateWidget(
                                sideHeght: 
                                  constraints.maxHeight > constraints.maxWidth
                                      ? constraints.maxWidth * 0.8
                                      : constraints.maxHeight * 0.8,
                              ),
                            );
                          } else if (state == OfferListStateEnum.loading)  {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.separated(
                              itemCount: 10,
                              itemBuilder: (context, index) => 
                                OfferListItemWidget(
                                  onTap: () {},
                                  title: 'Cooperativa de Energia',
                                  subtitle: 'R\$ 1000,00',
                                ),
                                separatorBuilder: (context, index) => 
                                const Divider(
                                    height: 1.0,
                                  ),
                            );
                          }
                        },
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
    ),
  );

  void _increaseValue(int value) {
    FocusScope.of(context).unfocus();
    valueOfEnergyAcount += value;
    valueController.text = currencyFormatter.format(
      valueOfEnergyAcount.toStringAsFixed(2),
    );
  }

  void _decreasingValue(int value) {
    FocusScope.of(context).unfocus();
    if (valueOfEnergyAcount > 0 && valueOfEnergyAcount - value > 0) {
      valueOfEnergyAcount -= value;
      
    } else {
      valueOfEnergyAcount = 0.0;
    }
    valueController.text = currencyFormatter.format(
      valueOfEnergyAcount.toStringAsFixed(2),
    );
  }
}
