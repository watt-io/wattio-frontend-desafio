import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/state/list_offers_state.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/store/list_offers_store.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/widgets/offer_details_widget.dart';
import 'package:wattio_frontend_desafio/modules/offers/presenter/widgets/offer_widget.dart';
import 'package:wattio_frontend_desafio/shared/formatters/currency_formatter.dart';
import 'package:wattio_frontend_desafio/shared/theme/color_theme.dart';

class ListOffersScreen extends StatefulWidget {
  const ListOffersScreen({super.key});

  @override
  State<ListOffersScreen> createState() => _ListOffersScreenState();
}

class _ListOffersScreenState extends State<ListOffersScreen> {
  late final GetIt getIt;
  late final ListOffersStore store;
  late GlobalKey<FormState> formKey;
  late TextEditingController valueController;
  late FocusNode valueFocus;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    getIt = GetIt.I;
    store = getIt<ListOffersStore>();
    formKey = GlobalKey<FormState>();
    valueController = TextEditingController(text: '1.000');
    valueFocus = FocusNode();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<ListOffersStore>();
    valueController.dispose();
    valueFocus.dispose();
    debounce?.cancel();
    super.dispose();
  }

  String? valueValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite o valor da conta de luz.';
    }

    int parsedValue = int.parse(value.replaceAll(RegExp(r'[^\d]'), ''));

    if (parsedValue < 1000 || parsedValue > 100000) {
      return 'O valor deve estar entre 1.000 e 100.000.';
    }

    return null;
  }

  void getOffer(String? _) {
    debounce?.cancel();
    debounce = Timer(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        String cleanedString = valueController.text.replaceAll('.', '');
        store.getOffers(int.parse(cleanedString));
      }
    });
  }

  Future<void> viewDetails(CooperativeEntity entity) async {
    String cleanedString = valueController.text.replaceAll('.', '');
    return showAdaptiveDialog<void>(
      context: context,
      builder: (ctx) => OfferDetailsWidget(entity, int.parse(cleanedString)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: valueFocus.unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Economize Agora',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Text(
                'Informe o valor médio mensal da sua conta de energia e veja ofertas para economizar.',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Form(
                key: formKey,
                child: TextFormField(
                  inputFormatters: [CurrencyFormatter()],
                  controller: valueController,
                  validator: valueValidator,
                  focusNode: valueFocus,
                  style: Theme.of(context).textTheme.displayLarge,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: getOffer,
                  onTapOutside: (_) => getOffer(null),
                  decoration: InputDecoration(
                    helperText: 'Mínimo de R\$ 1.000 e máximo de 100.000',
                    helperStyle: Theme.of(context).textTheme.bodySmall,
                    prefixText: 'R\$ ',
                    prefixStyle: Theme.of(context).textTheme.displayLarge,
                    labelStyle: Theme.of(context).textTheme.displayLarge,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColorTheme.secondary,
                        width: .0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ValueListenableBuilder(
                valueListenable: store,
                builder: (ctx, state, widget) {
                  return switch (state) {
                    ListOffersInitialState() => Container(),
                    ListOffersLoadingState() =>
                      const CircularProgressIndicator(),
                    ListOffersEmptyListState() => Text(
                        'Nenhuma oferta encontrada',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ListOffersSuccessState() => Expanded(
                        child: ListView.builder(
                          itemCount: state.offers.length,
                          itemBuilder: (context, index) => OfferWidget(
                            state.offers[index],
                            onTap: () => viewDetails(state.offers[index]),
                          ),
                        ),
                      ),
                    ListOffersFailureState() =>
                      const Text('Ops! Algo deu errado'),
                  };
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
