import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wattio_front/energy_cooperative/datasource/local_energy_cooperatives.dart';
import 'package:wattio_front/energy_cooperative/energy_cooperative_entity.dart';
import 'package:wattio_front/energy_cooperative/widgets/energy_cooperative_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<EnergyCooperative> energyCooperativeData =
      EnergyCooperativesDatasource.getLocalData();
  final TextEditingController _textEditingController = TextEditingController();
  final NumberFormat _realFormatter = NumberFormat.currency(
      customPattern: '\u00A4 #,###,000', locale: 'pt-br', symbol: 'R\$');

  late PersonType _personTypeSelected;
  late RangeValues _rangeValues;
  late double _sliderValue;
  late bool _showAllCooperatives;

  @override
  void initState() {
    double minRange = double.maxFinite;
    double maxRange = double.minPositive;

    for (var item in energyCooperativeData) {
      if (item.minMonthlyValue < minRange) {
        minRange = item.minMonthlyValue + 0.0;
      }
      if (item.maxMonthlyValue > maxRange) {
        maxRange = item.maxMonthlyValue + 0.0;
      }
    }

    _rangeValues = RangeValues(minRange, maxRange);
    _sliderValue = minRange;
    _textEditingController.text = _realFormatter.format(minRange);

    _personTypeSelected = PersonType.human;
    _showAllCooperatives = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var displayValueStyle = Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );

    var cooperativesToDisplay = <EnergyCooperative>[];

    for (var cooperative in energyCooperativeData) {
      bool inRange = (_sliderValue >= cooperative.minMonthlyValue &&
          _sliderValue <= cooperative.maxMonthlyValue);
      bool rightType = (_personTypeSelected == cooperative.personType ||
          cooperative.personType == PersonType.human);

      if (inRange && rightType) {
        cooperativesToDisplay.add(cooperative);
      }
    }

    return Center(
      child: Container(
        width: 460,
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.lightbulb_outline,
                  color: Colors.red,
                  size: 54,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Marketplace de Energia',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      ' Simule a economia da sua empresa hoje!',
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                )
              ],
            ),
            const Divider(height: 16),
            Text(
              'Selecione o tipo de pessoa:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text(
                        'Física',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      leading: Radio<PersonType>(
                        activeColor: Colors.red.shade600,
                        value: PersonType.human,
                        groupValue: _personTypeSelected,
                        onChanged: (value) {
                          setState(() {
                            _personTypeSelected = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text(
                        'Jurídica',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      leading: Radio<PersonType>(
                        activeColor: Colors.red.shade600,
                        value: PersonType.nonHuman,
                        groupValue: _personTypeSelected,
                        onChanged: (value) {
                          setState(() {
                            _personTypeSelected = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(indent: 68, endIndent: 68),
            Text(
              'Informe o valor mensal da sua conta de energia:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Container(
              width: 460,
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                style: displayValueStyle,
                decoration: const InputDecoration(border: InputBorder.none),
                controller: _textEditingController,
                onChanged: (value) {
                  double valueParsed = 0.0;
                  try {
                    valueParsed = _realFormatter.parse(value) as double;
                  } catch (e) {
                    valueParsed = 1000;
                  }
                  if (valueParsed < _rangeValues.start) {
                    valueParsed = _rangeValues.start;
                  } else if (valueParsed > _rangeValues.end) {
                    valueParsed = _rangeValues.end;
                  }
                  setState(() {
                    _textEditingController.text =
                        _realFormatter.format(valueParsed);
                    _sliderValue = valueParsed;
                  });
                },
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Deslize a barra abaixo ou mude o valor acima.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Slider(
              value: _sliderValue,
              min: _rangeValues.start,
              max: _rangeValues.end,
              activeColor: Colors.red.shade600,
              inactiveColor: Colors.blueGrey,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                  _textEditingController.text =
                      _realFormatter.format(value.round());
                });
              },
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mostrando ${cooperativesToDisplay.length} de ${energyCooperativeData.length} cooperativas',
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.builder(
                itemCount: cooperativesToDisplay.length,
                itemBuilder: (context, index) {
                  var economy =
                      (_sliderValue * energyCooperativeData[index].discount)
                          .toInt();
                  return EnergyCooperativeCard(
                      name: cooperativesToDisplay[index].name,
                      discount: cooperativesToDisplay[index].discount,
                      economy: economy,
                      personType: cooperativesToDisplay[index].personType);
                },
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Está é apenas uma simulação e não configura garantia do desconto',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
