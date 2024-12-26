import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../home.dart';

class HomeViewStableState extends StatefulWidget {
  final BlocState state;
  final HomeBloc bloc;

  const HomeViewStableState({required this.state, required this.bloc, Key? key})
      : super(key: key);

  @override
  State<HomeViewStableState> createState() => _HomeViewStableStateState();
}

class _HomeViewStableStateState extends State<HomeViewStableState> {
  HomeStableData get data => widget.state.data;
  late bool economyCalculated;
  late int selectedItemIndex;
  late double selectedValue;

  @override
  void initState() {
    super.initState();
    selectedItemIndex = -1;
    economyCalculated = false;
    selectedValue = 1000;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onValueChanged(double value) {
    selectedValue = value;
  }

  Widget buildAppBar() {
    return AppBar();
  }

  Widget buildTopSection() {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Icon(
            Icons.home_work_outlined,
            size: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              'Calcule a economia da sua empresa',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSlider() {
    return CustomSliderWithTextFieldWidget(
      onValueChanged: onValueChanged,
    );
  }

  Widget buildCalculationButton() {
    return FilledButton(
      onPressed: () {
        widget.bloc.dispatchEvent(
          HomeEventCalculateOffer(context, value: selectedValue),
        );

        setState(() {
          economyCalculated = false;
        });
      },
      child: const Text('Calcular ofertas!'),
    );
  }

  Widget buildOfferList() {
    final List<OfferModel> listOffer = data.listOffer;

    return listOffer.isEmpty
        ? Container()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: listOffer.length,
            itemBuilder: (context, index) {
              final offer = listOffer[index];

              return Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Card(
                    child: ListTile(
                      selected: selectedItemIndex == index,
                      selectedColor: Colors.deepPurple,
                      onTap: () {
                        setState(() {
                          selectedItemIndex = index;
                        });
                      },
                      title: Text(
                        'Oferta $index',
                      ),
                      subtitle: Text(
                        'Cooperativa: ${offer.name}',
                      ),
                      trailing: selectedItemIndex == index
                          ? const Icon(Icons.check)
                          : const SizedBox.shrink(),
                    ),
                  ));
            },
          );
  }

  Widget buildCalculateEconomyButton() {
    return selectedItemIndex >= 0
        ? FilledButton(
            onPressed: () {
              widget.bloc.dispatchEvent(
                HomeEventCalculateEconomy(
                  model: data.listOffer.elementAt(selectedItemIndex),
                ),
              );

              selectedItemIndex = -1;
              setState(() {
                economyCalculated = true;
              });
            },
            child: const Text('Calcular economia'),
          )
        : Container();
  }

  Widget buildEconomyInfo() {
    final EconomyEntity? economyModel = data.economyModel;

    return economyModel != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Card(
              child: Column(
                children: [
                  const Text('Minha economia anual será de até'),
                  Text('R\$ ${economyModel.economyYear.toStringAsFixed(2)}'),
                ],
              ),
            ),
          )
        : Container();
  }

  Widget buildEconomyAverage() {
    final EconomyEntity? economyModel = data.economyModel;

    return economyModel != null
        ? Text(
            'Em média R\$ ${economyModel.economyMonth.toStringAsFixed(2)} por mês*')
        : Container();
  }

  Widget buildAssinateEnergy() {
    return economyCalculated == true
        ? FilledButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        title: Text('Parabens'),
                      ));
              widget.bloc.dispatchEvent(HomeEventOnReady());
              setState(() {
                economyCalculated = false;
              });
            },
            child: const Text('Quero contratar!'))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTopSection(),
                const SizedBox(height: 16),
                const Text(
                  'O valor médio mensal da minha conta de energia é',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                buildSlider(),
                const SizedBox(height: 16),
                buildCalculationButton(),
                const SizedBox(height: 24),
                buildOfferList(),
                const SizedBox(height: 24),
                buildCalculateEconomyButton(),
                const SizedBox(height: 16),
                buildEconomyInfo(),
                const SizedBox(height: 8),
                buildEconomyAverage(),
                const SizedBox(height: 24),
                buildAssinateEnergy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
