import 'package:desafio_wattio/components/header.dart';
import 'package:desafio_wattio/components/oferta_card.dart';
import 'package:desafio_wattio/components/action_button.dart';
import 'package:desafio_wattio/components/savings.dart';
import 'package:desafio_wattio/components/slider_conta.dart';
import 'package:desafio_wattio/components/valor_conta_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/cooperativas_mock.dart';
import '../models/cooperativa.dart';
import '../utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _brl = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  bool _alreadyCalculatedOffer = false;
  bool _alreadyCalculatedSavings = false;

  double _sliderValue = 1000;
  double _selectedValue = 0;
  double _calculatedValue = 0;
  Cooperativa? _selectedCoop;
  Cooperativa? _lastCalculatedCoop;

  double? _savings;

  List<Cooperativa> _ofertasParaValor(double conta) {
    return cooperativas.where((c) => c.aceitaValor(conta)).toList();
  }

  void _calcularOfertas() {
    setState(() {
      _selectedCoop = null;
      _selectedValue = _sliderValue;
      if (!_alreadyCalculatedOffer) _alreadyCalculatedOffer = true;
    });
  }

  void _calcularEconomia() {
    final coop = _selectedCoop;
    double savings = coop?.calcularEconomia(_selectedValue) ?? 0.0;

    setState(() {
      _calculatedValue = _selectedValue;
      _savings = savings;
      _lastCalculatedCoop = coop;
      if (!_alreadyCalculatedSavings) _alreadyCalculatedSavings = true;
    });
  }

  void _showCongratulations() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      builder: (_) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 320,
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Text(
                'Parabéns!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final offers = _ofertasParaValor(_selectedValue);
    final sameCoop = _selectedCoop?.nome == _lastCalculatedCoop?.nome;

    return Scaffold(
      body: Align(
        alignment: AlignmentGeometry.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false, overscroll: false),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Header(),
                  const SizedBox(height: 14),
                  ValorContaCard(value: _brl.format(_sliderValue)),

                  Text(
                    'Mova a barra abaixo para selecionar o valor. Mínimo de R\$ 1.000,00.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),

                  SliderConta(
                    valor: _sliderValue,
                    onChanged: (v) => setState(() => _sliderValue = v),
                  ),

                  ActionButton(
                    text: _alreadyCalculatedOffer
                        ? 'Recalcular ofertas!'
                        : 'Calcular ofertas!',
                    onPressed: _calcularOfertas,
                    blockButton: _selectedValue == _sliderValue,
                  ),

                  const SizedBox(height: 10),

                  if (offers.isNotEmpty)
                    OfertaCard(
                      offers: offers,
                      selected: _selectedCoop,
                      onSelect: (c) => setState(() => _selectedCoop = c),
                    ),

                  if (_alreadyCalculatedOffer)
                    ActionButton(
                      text: _alreadyCalculatedSavings
                          ? 'Recalcular economia'
                          : 'Calcular economia',
                      onPressed: _calcularEconomia,
                      blockButton:
                          _calculatedValue == _selectedValue && sameCoop,
                    ),

                  if (_savings != null) Savings(monthlySavings: _savings!),

                  if (_alreadyCalculatedSavings)
                    ActionButton(
                      text: 'Quero Contratar',
                      onPressed: _showCongratulations,
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
