import 'package:flutter/material.dart';
import 'package:wattio/src/shared/theme/images.dart';
import 'package:wattio/src/shared/models/proposal_model.dart';

import '../../../shared/internet_controller.dart';
import 'components/proposal_card_widget_mobile.dart';
import 'home_controller_mobile.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final HomeController _homeController = HomeController();

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.02),
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.cyan.shade300,
                            Colors.blue.shade300,
                            Colors.blueAccent
                          ]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: size.width * 0.09),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AppImages.clouds,
                                height: size.height * 0.2,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.09),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    AppImages.logo,
                                    width: size.width * 0.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                height: size.height * 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text(
                                            'Internet',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        ValueListenableBuilder(
                                          valueListenable:
                                              InternetController.isInternetOn,
                                          builder: (BuildContext context, value,
                                                  Widget? child) =>
                                              Switch(
                                            value: InternetController
                                                .isInternetOn.value,
                                            onChanged: (bool value) => setState(
                                              () => InternetController
                                                  .changeStateInternet(value),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text('Author: viniciusddrft')
                                  ],
                                ),
                              ),
                            ),
                            icon: const Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.2),
                    child: Center(
                      child: SizedBox(
                        height: size.height * 0.25,
                        width: size.width * 0.90,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    color: Colors.blueAccent,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Valor mensal da sua energia',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, right: 60),
                                  child: TextField(
                                    controller:
                                        _homeController.textEditingController,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 30),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                    onChanged: _homeController.keyboardInput,
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _homeController.currentValue,
                                  builder: (BuildContext context, value,
                                          Widget? child) =>
                                      Slider(
                                    value: _homeController.currentValue.value,
                                    min: _homeController.valueMin,
                                    max: _homeController.valueMax,
                                    activeColor: Colors.blueAccent,
                                    onChanged: _homeController.onSlider,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Colors.cyan.shade300,
                              Colors.blue.shade300,
                              Colors.blueAccent
                            ]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.business,
                            size: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Ótimos',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Serviços',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height: size.height * 0.1,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Colors.cyan.shade300,
                              Colors.blue.shade300,
                              Colors.blueAccent
                            ]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.monetization_on,
                            size: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Descontos',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Práticos',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade300,
        child: FractionallySizedBox(
          heightFactor: 0.4,
          widthFactor: 1,
          child: Card(
            color: const Color(0xff101A1F),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 30),
                    child: SizedBox(
                      height: 15,
                      width: 200,
                      child: Card(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: _homeController.getProposals(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProposalModel>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ValueListenableBuilder(
                            valueListenable: _homeController.currentValue,
                            builder:
                                (BuildContext context, value, Widget? child) =>
                                    Column(
                              children: [
                                for (ProposalModel proposal in snapshot.data!)
                                  _homeController.currentValue.value >=
                                          proposal.valorMinimoMensal
                                      ? _homeController.currentValue.value <=
                                              proposal.valorMaximoMensal
                                          ? ProposalCardWidgetMobile(
                                              nome: proposal.nome,
                                              desconto: proposal.desconto,
                                              valorMaximoMensal:
                                                  proposal.valorMaximoMensal,
                                              valorMinimoMensal:
                                                  proposal.valorMinimoMensal,
                                              value: _homeController
                                                  .currentValue.value,
                                            )
                                          : Container()
                                      : Container()
                              ],
                            ),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Não foi possivel acessar a internet',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(Icons.signal_wifi_off_rounded,
                                  color: Colors.white)
                            ],
                          );
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
