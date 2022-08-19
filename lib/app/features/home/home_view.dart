// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'widgets/offer_list_item_widget.dart';
import 'widgets/widgets.dart';

class HomeView extends StatelessWidget  {
  HomeView({Key? key}) : super(key: key);

  final currencyFormatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    name: 'R\$',
  );

  OfferListState _offerListState = OfferListState.showing;

  @override
  Widget build(BuildContext context) => SafeArea(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AutoSizeText(
                            'Insira o valor médio da sua conta de energia',
                            style: Theme.of(context).textTheme.headline6,
                            maxFontSize: 18,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                hint: 'Ex: R\$ 1000,00',
                                inputFormatters: [currencyFormatter],
                                prefix: const Icon(Icons.price_change),
                                textInputType: TextInputType.number,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            ButtonGroupChangeValueWidget(
                              onIncrease: (value) {
                                log('onIncrease: $value');
                              },
                              onDecreasing: (value) {
                                log('onDecreasing: $value');
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        ButtonAppWidget(
                          isLoading: false,
                          onPressed: () {},
                          child: Text(
                            'Buscar ofertas',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (_offerListState == OfferListState.initial) {
                      return InitialStateWidget(
                      sideHeght: constraints.maxHeight > constraints.maxWidth
                        ? constraints.maxWidth * 0.8
                        : constraints.maxHeight * 0.8,
                    );

                    } else if (_offerListState == OfferListState.voidState)  {
                      return VoidStateWidget(
                        sideHeght: constraints.maxHeight > constraints.maxWidth
                          ? constraints.maxWidth * 0.8
                          : constraints.maxHeight * 0.8,
                      );
                    } else if (_offerListState == OfferListState.loading)  {
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
                          separatorBuilder: (context, index) => const Divider(
                            height: 1.0,
                          ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
  );
}
