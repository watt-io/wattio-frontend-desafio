import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class CustomSliderWithTextFieldWidget extends StatefulWidget {
  final Function(double value) onValueChanged;

  const CustomSliderWithTextFieldWidget({
    super.key,
    required this.onValueChanged,
  });

  @override
  CustomSliderWithTextFieldWidgetState createState() =>
      CustomSliderWithTextFieldWidgetState();
}

class CustomSliderWithTextFieldWidgetState
    extends State<CustomSliderWithTextFieldWidget> {
  late TextEditingController controller;
  late double sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = 1000;
    controller = TextEditingController(text: "R\$ 1.000,00");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            controller: controller,
            inputFormatters: [
              CurrencyTextInputFormatter(
                locale: 'pt',
                symbol: "R\$",
                decimalDigits: 2,
              )
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Valor',
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {
                sliderValue = double.tryParse(text) ?? 1000;
                if (sliderValue >= 100000) {
                  sliderValue = 100000;
                }
              });
            },
          ),
        ),
        const Text(
          'Digite o valor acima. Mínimo de R\$ 1.000,00',
          style: TextStyle(color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        Slider(
          min: 0,
          max: 100000,
          value: sliderValue,
          onChanged: (v) {
            setState(() {
              sliderValue = v;
              final text = CurrencyTextInputFormatter(
                locale: 'pt',
                symbol: "R\$",
                decimalDigits: 2,
              ).formatDouble(v);
              controller.text = text;
              widget.onValueChanged(v);
            });
          },
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
