import 'package:cooperatives_energy/controller/OffersController.dart';
import 'package:cooperatives_energy/model/Offers.dart';
import 'package:cooperatives_energy/model/Person.dart';
import 'package:cooperatives_energy/util/ImageConstants.dart';
import 'package:cooperatives_energy/widgets/WidgetsCustoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class OffersScreen extends StatefulWidget {
  final Person? person;

  const OffersScreen({Key? key, this.person}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _controller = OffersController();

  final _controllerMoney = MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: ' R\$: ');

  @override
  void initState() {
    _controller.init(widget.person!.money, widget.person!.isPhysicalPerson);

    _controllerMoney.text = widget.person!.money;

    super.initState();
  }

  @override
  void dispose() {
    _controllerMoney.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsCustoms()
          .appBar(context, "Olá ${widget.person!.name}", showBackPress: true),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 15),
            child: TextField(
              controller: _controllerMoney,
              style: const TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  filled: true,
                  fillColor: Theme.of(context).backgroundColor,
                  labelText: 'Valor médio de energia',
                  errorText:
                      _controller.isValidateMoney ? "Verifique o campo" : null),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  if (_controller.verifyRangeValue(text)) {
                    _controller.setNewFilter(text);
                    _controller.isValidateMoney = false;
                  } else {
                    _controller.isValidateMoney = true;
                  }
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Ofertas',
              style: TextStyle(fontSize: 16, color: Colors.amber),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: _controller.getOffersListFuture,
              builder: (BuildContext context, AsyncSnapshot<List<Offer>> s) {
                if (s.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                return FlutterCarousel.builder(
                  options: CarouselOptions(
                      showIndicator: true,
                      slideIndicator: const CircularSlideIndicator(),
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          _controller.currentOffer = s.data![index];
                        });
                      }),
                  itemCount: s.data!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 30),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                s.data![itemIndex].nome,
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Image.memory(
                                  gaplessPlayback: true,
                                  scale: 4,
                                  ImageConstants()
                                      .decodeBase64(s.data![itemIndex].imagen)),
                              const Spacer(),
                              Text(
                                'Pessoa: ${_controller.personType} ',
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                              Text(
                                'Economia: ${_controller.descontoFormat(s.data![itemIndex].desconto)}',
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                              Text(
                                  "Economia Anual: R\$: ${_controller.annualSavings(s.data![itemIndex].desconto, _controllerMoney.text)}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18.0, color: Colors.black)),
                              Text(
                                  "Media por mes: R\$: ${_controller.annualAverage(s.data![itemIndex].desconto, _controllerMoney.text)}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18.0, color: Colors.black)),
                              const SizedBox(height: 20),
                            ],
                          )),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                ),
                onPressed: () {
                  setState(() {
                    WidgetsCustoms().dialogBuilder(context, "Contratado",
                        'Voçe acaba de aceitar a oferta ${_controller.currentOffer.nome}');
                  });
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(right: 35, left: 35, top: 5, bottom: 5),
                  child: Text('Contratar', style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
