import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_teste_wattio/app/shared/stores/cooperative_store.dart';

import '../../shared/constants/images_paths.dart';
import '../../shared/models/cooperativa_model.dart';
import '../../shared/theme_colors.dart';
import '../../shared/widgets/button_default.dart';
import '../../shared/widgets/card_details_coop.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final HomeController homeControler = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundWhite,
      body: LayoutBuilder(
        builder: (_, constraints) {
          homeControler.constraintsScreen = constraints;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      'Vamos economizar?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    _cardInfo(),
                    const SizedBox(
                      height: 25,
                    ),
                    _cardSearch(),
                    const SizedBox(
                      height: 25,
                    ),
                    ScopedBuilder<CooperativeStore, Exception,
                        List<CooperativeModel>>(
                      store: homeControler.storeCooperativa,
                      onLoading: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onError: (context, err) => const Center(
                        child: Text('Ocorreu um erro ao carregar os dados'),
                      ),
                      onState: (context, state) {
                        bool noCooperativaFound =
                            state.isEmpty && homeControler.showSearch;
                        bool noSearchActive =
                            state.isEmpty && !homeControler.showSearch;

                        if (noCooperativaFound) {
                          return const Text(
                            'Não encontramos uma cooperativa que atenda o seu gasto médio mensal. Por favor, ajuste o valor e tente novamente.',
                            textAlign: TextAlign.center,
                          );
                        }

                        if (noSearchActive) {
                          return const SizedBox();
                        }

                        return RxBuilder(
                          builder: (context) => homeControler.showSearch
                              ? resultado(state)
                              : const SizedBox(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget resultado(List<CooperativeModel> listaCooperatives) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resultado:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        CardDetailsCoop(
          cooperative: listaCooperatives.first,
          valueEnergy: homeControler.valueEnergy,
        ),
        const SizedBox(height: 8),
        Center(
          child: ButtonDefault(
            text: 'Ver outras cooperativas',
            height: homeControler.constraintsScreen!.maxHeight * 0.04,
            width: homeControler.constraintsScreen!.maxWidth * 0.50,
            marginHorizontal: 0,
            borderRadius: 15,
            onPressed: () => Modular.to.pushNamed(
              '/home/outras-coops/${homeControler.valueEnergy}',
              arguments: listaCooperatives,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _cardInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 120,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(35),
        ),
        color: ThemeColor.lightColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPaths.iconApp,
            width: 60,
          ),
          const Flexible(
            child: Text(
              'Busque por cooperativas e economize na sua conta de energia!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: ThemeColor.primaryColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ThemeColor.backgroundWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Digite o valor médio de sua conta de energia:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200],
                    ),
                    child: Center(
                        child: Form(
                      key: homeControler.formKey,
                      child: TextFormField(
                        controller: homeControler.controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Ex: R\$ 1.000,00',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RxBuilder(
            builder: (context) {
              return ButtonDefault(
                text: !homeControler.showSearch
                    ? 'Buscar melhor preço'
                    : 'Buscar novamente',
                height: homeControler.constraintsScreen!.maxHeight * 0.07,
                width: homeControler.constraintsScreen!.maxWidth * 0.50,
                marginHorizontal: 10,
                borderRadius: 15,
                onPressed: () {
                  if (homeControler.formKey.currentState!.validate()) {
                    if (homeControler.controller.text.isEmpty) {
                      return;
                    }

                    homeControler.valueEnergy = double.parse(
                      homeControler.controller.text
                          .trim()
                          .replaceAll('R\$', '')
                          .replaceAll('.', '')
                          .replaceAll(',', '.'),
                    );

                    homeControler.storeCooperativa
                        .getCooperatives(homeControler.valueEnergy);
                    homeControler.showSearch = true;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
