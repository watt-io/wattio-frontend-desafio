import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:wattio_frontend_desafio/models/cooperativa.dart';
import 'package:wattio_frontend_desafio/widgets/cooper_list.dart';
import 'package:wattio_frontend_desafio/widgets/desconto_info.dart';
import 'package:wattio_frontend_desafio/services/cooperativa_services.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MarketplacePageState();
}

const Color lightColor = Color(0xff2a3132);
Color highlightColor = const Color(0xffff420e);
Color darkColor = const Color(0xff89da59);
const double valueMin = 1000.0;
const double valueMax = 300000.0;

class MarketplacePageState extends State<MarketplacePage> {
  late final TextEditingController valueController;

  late final NumberFormat valueFormat =
      NumberFormat.currency(locale: 'pt-br', symbol: 'R\$');

  bool _refreshOfertas = true;
  double valueDouble = valueMin;
  double valuePrintable = valueMin;
  bool _ofertasVisibleFlag = false;
  List<Cooperativa> _cooperativas = [];
  Cooperativa? _selectedCooperativa;

  @override
  void initState() {
    valueController =
        TextEditingController(text: valueFormat.format(valueDouble));

    super.initState();
  }

  @override
  void dispose() {
    valueController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CooperativaServices cooperativaServices =
        Provider.of<CooperativaServices>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 49, left: 22),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.store_mall_directory_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Text(
                          'Calcule a economia\nda sua empresa',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width < 360 ? 21 : 27,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 19, top: 31),
                    constraints: const BoxConstraints(maxWidth: 390),
                    child: Text(
                      'O valor médio mensal da minha conta de energia é:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width < 350 ? 13 : 15,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    constraints: const BoxConstraints(maxWidth: 350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: darkColor.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: valueController,
                      cursorColor: darkColor,
                      onChanged: (value) {
                        try {
                          var _value = valueFormat.parse(value);
                          if (_value < valueMin || _value > valueMax) {
                            throw Exception();
                          }
                          valueDouble = _value.toDouble();
                          _refreshOfertas = true;
                        } catch (e) {}
                      },
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: highlightColor,
                        fontWeight: FontWeight.w900,
                        fontSize: size.width < 350 ? 39 : 44,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    constraints: const BoxConstraints(maxWidth: 346),
                    child: Text(
                      'Digite o valor acima ou mova a '
                      'barra abaixo. Mínimo de '
                      '${valueFormat.format(valueMin)}.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Slider(
                inactiveColor: darkColor,
                activeColor: highlightColor,
                min: valueMin,
                max: valueMax,
                value: valueDouble,
                onChanged: (double value) {
                  setState(() {
                    valueDouble = value;
                    _refreshOfertas = true;
                  });

                  valueController.text = valueFormat.format(valueDouble);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  constraints: const BoxConstraints(maxWidth: 350),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color:
                        _refreshOfertas ? highlightColor : Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: _refreshOfertas
                            ? highlightColor.withOpacity(0.5)
                            : Colors.grey.shade300.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: !_refreshOfertas
                        ? null
                        : () async {
                            cooperativaServices.valor = valueDouble;

                            try {
                              await cooperativaServices.getCoopList();

                              setState(() {
                                _cooperativas = cooperativaServices.coperativas;
                                _ofertasVisibleFlag = true;
                                _refreshOfertas = false;
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Erro: $e')),
                              );
                            }
                          },
                    child: Text(
                      _ofertasVisibleFlag
                          ? 'Recalcular ofertas!'
                          : 'Calcular ofertas!',
                      style: const TextStyle(
                        color: lightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CooperList(
                  cooperativas: _cooperativas,
                  selectedCooperativa: _selectedCooperativa,
                  onSelected: (cooperativa) {
                    setState(() {
                      _selectedCooperativa = cooperativa;
                    });
                  },
                ),
              ),
              DescontoInfo(
                cooperativaSelecionada: _selectedCooperativa,
                valorUsuario: valueDouble,
              )
            ],
          ),
        ),
      ),
    );
  }
}
