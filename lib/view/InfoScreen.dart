import 'package:cooperatives_energy/model/Person.dart';
import 'package:cooperatives_energy/widgets/WidgetsCustoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../controller/InfoController.dart';
import 'OffersScreen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _controller = InfoController();

  final _controllerName = TextEditingController();

  final _controllerMoney = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: ' R\$: ');

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerMoney.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsCustoms().appBar(context, "WATTIO"),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "A sua gestão cada vez mais na palma da sua mão",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    "Insira seus dados para começar",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: TextField(
                    controller: _controllerName,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),),
                      labelText: 'Nome',
                      hintText: 'Maria',
                      errorText:
                          _controller.validateName ? "Campo vazio" : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: _controllerMoney,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'Valor Medio de energia',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text("Para sua casa ou empresa?"),
                ),
                ToggleButtons(
                  isSelected: _controller.selectedOptions,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < _controller.selectedOptions.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          _controller.selectedOptions[buttonIndex] = true;
                        } else {
                          _controller.selectedOptions[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        child: Row(
                          children: [Icon(Icons.person), Text("Fisica")],
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: Row(
                        children: [Icon(Icons.domain), Text("Juridica")],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.validateName = _controllerName.text.isEmpty;
                        _controller.validateMoney =
                            _controllerMoney.text.isEmpty;

                        if (!_controller.selectedOptions.contains(true)) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.black87,
                            content: Text('Para sua casa ou empresa ?',
                                style: TextStyle(color: Colors.white)),
                          ));
                          return;
                        }

                        if (_controller.verifyFields()) {
                          return;
                        }

                        if (_controller.verifyRange(_controllerMoney.text)) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              settings:
                                  const RouteSettings(name: '/offersScreen'),
                              builder: (context) => OffersScreen(
                                  person: Person(
                                      _controllerName.text,
                                      _controllerMoney.text,
                                      _controller.selectedOptions[0])),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.black87,
                              content: Text(
                                  'Valor Medio deve ser entre R\$: 1000,00 e R\$: 100.000,00', style: TextStyle(color: Colors.white))));
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          right: 35, left: 35, top: 5, bottom: 5),
                      child: Text('Proceguir', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
