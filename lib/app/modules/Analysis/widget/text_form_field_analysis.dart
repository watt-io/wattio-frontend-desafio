import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../shared/util/formatters/currency_pt_brInput_formatter.dart';
import '../../../shared/util/theme/colors_app.dart';

class TextFormFieldAnalysis extends StatefulWidget {
  final void Function(double) onChanged;

  const TextFormFieldAnalysis({
    required this.onChanged,
    super.key,
  });

  @override
  State<TextFormFieldAnalysis> createState() => _TextFormFieldAnalysisState();
}

class _TextFormFieldAnalysisState extends State<TextFormFieldAnalysis> {
  late double _value;
  late Function(double) _onChanged;
  late TextEditingController _controller;

  @override
  void initState() {
    _value = 0;

    _onChanged = (newValue) {
      setState(() {
        _value = newValue;
      });
      
      _controller.value = TextEditingValue(
        text: _formatCurrency(newValue),
        selection: TextSelection.collapsed(
          offset: _formatCurrency(newValue).length,
        ),
      );

      widget.onChanged(newValue);
    };

    _controller = TextEditingController()
      ..text = _formatCurrency(_value);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  String _formatCurrency(double value) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return currencyFormatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 290,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 8,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorsApp.primary,
                fontSize: 38,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorsApp.white,
                hintText: 'R\$ 0,00',
                hintStyle: TextStyle(
                  color: ColorsApp.primary,
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyPtBrInputFormatter(),
              ],
              onChanged: (value) {
                final doubleValue = double.tryParse(value.replaceAll(RegExp('[^0-9]'), ''))! / 100;
                _onChanged(doubleValue);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Digite o valor acima ou mova a barra a baixo. Mínimo de R\$ 1.000,00',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsApp.black,
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
        SfTheme(
          data: SfThemeData(
            sliderThemeData: SfSliderThemeData(
              activeTrackColor: ColorsApp.primary,
              inactiveTrackColor: ColorsApp.gray,
              thumbColor: ColorsApp.primary,
              overlayColor: ColorsApp.primary.withOpacity(0.1),
            ),
          ),
          child: SfSlider(
            value: _value > 1000000 ? 1000000 : _value,
            min: 1000,
            max: 1000000,
            stepSize: 1.0,
            onChanged: (dynamic newValue) {
              _onChanged(newValue);
            },
          ),
        ),
      ],
    );
  }
}
