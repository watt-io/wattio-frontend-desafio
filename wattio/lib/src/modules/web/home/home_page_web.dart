import 'package:flutter/material.dart';
import 'package:wattio/src/shared/theme/images.dart';

import '../../../shared/models/proposal_model.dart';
import 'components/proposal_card_widget_web.dart';
import 'home_controller_web.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppImages.logo),
        title: RichText(
          text: const TextSpan(
            text: 'WATT',
            style: TextStyle(
                fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: 'io',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          height: size.height * 0.3,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.cyan.shade300,
                  Colors.blue.shade300,
                  Colors.blueAccent
                ]),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.1, bottom: size.height * 0.05),
              child: Center(
                child: SizedBox(
                  height: size.height * 0.3590038,
                  width: size.width * 0.30,
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Calcule a economia da sua empresa',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'O valor medio mensal da minha conta de energia é:',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: TextField(
                              controller: _homeController.textEditingController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: _homeController.keyboardInput,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                                'Digite o valor a cima ou mova a barra a baixo.Minimo de R\$1000.',
                                textAlign: TextAlign.center),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _homeController.currentValue,
                            builder:
                                (BuildContext context, value, Widget? child) =>
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
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
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
                                        ? ProposalCardWidgetWeb(
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
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.signal_wifi_off_rounded)
                          ],
                        );
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
