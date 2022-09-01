import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import 'blocs/blocs.dart';
import 'repository/repository.dart';
import 'widgets/widgets.dart';

class HomeView extends StatefulWidget  {
  const HomeView({Key? key, this.bloc}) : super(key: key);
  final HomeBloc? bloc;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late final HomeBloc bloc;
  
  @override
  void initState() {
    super.initState();
    bloc = widget.bloc ?? HomeBloc(repository: HomeRepository());
    bloc.add(OfferListEventInitial());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
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
                            '''Insira o valor médio mensal da sua conta de energia''',
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
                                  inputFormatters: [bloc.currencyFormatter],
                                  prefix: const Icon(Icons.price_change),
                                  controller: bloc.valueController,
                                  textInputType: TextInputType.number,
                                  onChanged: (value) {
                                    bloc.valueOfEnergyAcount = 
                                        bloc.currencyFormatter
                                        .getUnformattedValue()
                                        .toDouble();
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              ButtonGroupChangeValueWidget(
                                onIncrease: (value) => 
                                    bloc.increaseValue(value, context),
                                onDecreasing: (value) => 
                                    bloc.decreaseValue(value, context),
                              )
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          BlocBuilder<HomeBloc, OfferListState>(
                            bloc: bloc,
                            builder: (context, state) => ButtonAppWidget(
                                isLoading: state is OfferListStateLoading,
                                onPressed: () {
                                  if(bloc.valueController.text.isNotEmpty
                                    && bloc.valueOfEnergyAcount > 0) {
                                    FocusScope.of(context).unfocus();
                                    bloc.add(OfferListEventLoading());
                                  }
                                },
                                child: Text(
                                  'Buscar ofertas',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context
                                    ).colorScheme.tertiary,
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
                  child: BlocBuilder<HomeBloc, OfferListState>(
                    bloc: bloc,
                    builder: (context, state) => LayoutBuilder(
                        builder: (context, constraints) {
                          if (state is OfferListStateInitial) {
                            return Center(
                              child: InitialStateWidget(
                              sideHeght: 
                                constraints.maxHeight > constraints.maxWidth
                                    ? constraints.maxWidth * 0.8
                                    : constraints.maxHeight * 0.8,
                              ),
                            );
                          } 
                          
                          else if (state is OfferListStateEmpty)  {
                            if (!bloc.stateEmptySnackbarDisplayed) {
                              SchedulerBinding
                                  .instance
                                  .addPostFrameCallback((_) async {
                                  bloc.buildSnackBar(
                                    context, 
                                    '''Nenhuma oferta encontrada para o valor informado''', 
                                    false
                                  );
                              });
                              bloc.stateEmptySnackbarDisplayed = true;
                            }
                            return Center(
                              child: EmptyStateWidget(
                                sideHeght: 
                                  constraints.maxHeight > constraints.maxWidth
                                      ? constraints.maxWidth * 0.8
                                      : constraints.maxHeight * 0.8,
                              ),
                            );
                          } 
                          
                          else if (state is OfferListStateLoading)  {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } 
                          
                          else if (state is OfferListStateError)  {
                            SchedulerBinding
                                .instance
                                .addPostFrameCallback((_) async {
                              bloc.buildSnackBar(context, state.error!, true);
                              bloc.add(OfferListEventInitial());
                            });
                          }

                          return ListView.separated(
                            itemCount: state.offerList.length,
                            itemBuilder: (context, index) {
                              final double savingsPercentageDouble =
                                  state.offerList[index]
                                    .savingsPercentage * 100;
                              
                              final String savingsPercentage;

                              if (savingsPercentageDouble -
                                  savingsPercentageDouble.floor() > 0.01) {
                                savingsPercentage =
                                    '''${savingsPercentageDouble.toStringAsFixed(2)}%''';
                              } else {
                                savingsPercentage =
                                    '''${savingsPercentageDouble.toStringAsFixed(0)}%''';
                              }


                              return OfferListItemWidget(
                                onTap: () =>
                                    bloc.goToOffer(
                                      context,
                                      state.offerList[index]..id = index,
                                    ),
                                title: state.offerList[index].title,
                                subtitle: 'Economia: $savingsPercentage',
                                leading: Hero(
                                  tag: index,
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        bottomLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                      child: Image.asset(
                                        Assets.handLight,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => 
                                const Divider(
                                  height: 1.0,
                                ),
                          );
                        },
                      )
                  ),
                )
              ],
            ),
          ),
        ),
    ),
  );
}
