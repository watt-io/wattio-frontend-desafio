import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wattio_frontend_desafio/models/cooperativa.dart';
import 'package:wattio_frontend_desafio/services/cooperativa_services.dart';

class DescontoInfo extends StatefulWidget {
  final Cooperativa? cooperativaSelecionada;
  final double valorUsuario;

  const DescontoInfo({
    Key? key,
    required this.cooperativaSelecionada,
    required this.valorUsuario,
  }) : super(key: key);

  @override
  _DescontoInfoState createState() => _DescontoInfoState();
}

const Color lightColor = Color(0xff2a3132);
Color highlightColor = const Color(0xffff420e);
Color darkColor = const Color(0xff89da59);
const double valueMin = 1000.0;
const double valueMax = 100000.0;

class _DescontoInfoState extends State<DescontoInfo> {
  double? _valorAnual;
  double? _valorMensal;

  @override
  void didUpdateWidget(covariant DescontoInfo oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Quando mudar a cooperativa, recalcula.
    if (oldWidget.cooperativaSelecionada != widget.cooperativaSelecionada) {
      _calcularDesconto();
    }
  }

  void _calcularDesconto() {
    if (widget.cooperativaSelecionada == null) return;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final cooperativaServices =
          Provider.of<CooperativaServices>(context, listen: false);
      cooperativaServices.oferta = widget.cooperativaSelecionada;
      cooperativaServices.valor = widget.valorUsuario;

      final desconto = await cooperativaServices.calculoDesconto();

      if (!mounted) return;

      setState(() {
        _valorAnual = desconto?.valorAnual;
        _valorMensal = desconto?.valorMensal;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_valorAnual == null || _valorMensal == null) {
      return SizedBox.shrink(); // Não exibe nada enquanto não tiver valores
    }

    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(
                          top: 28,
                          bottom: 4,
                        ) +
                        EdgeInsets.only(
                          left: size.width >= 480 ? 32 : 0,
                        ),
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Text(
                      'Minha economia anual será de até',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: lightColor,
                        fontSize: size.width < 350 ? 16 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                          bottom: 16,
                        ) +
                        const EdgeInsets.only(
                          left: 0,
                          top: 56,
                        ),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'R\$ ${_valorAnual!.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: highlightColor,
                        fontSize: size.width < 350
                            ? 40
                            : size.width < 410
                                ? 42
                                : 52,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Em média',
                    style: TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width < 360 ? 16 : 18,
                    ),
                  ),
                  TextSpan(
                    text: ' R\$ ${_valorMensal!.toStringAsFixed(2)} ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width < 375 ? 21 : 26,
                    ),
                  ),
                  TextSpan(
                    text: 'por mês*',
                    style: TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: size.width < 360 ? 16 : 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 16),
            constraints: const BoxConstraints(maxWidth: 363),
            child: const Text(
              '*Essa é apenas uma simulação e não configura garantia do desconto.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4),
          margin: const EdgeInsets.only(top: 18, bottom: 24),
          constraints: const BoxConstraints(maxWidth: 340),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: highlightColor,
            boxShadow: [
              BoxShadow(
                color: highlightColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        backgroundColor: highlightColor,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Parabéns!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: lightColor,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ));
            },
            child: const Text(
              'Quero contratar!',
              style: TextStyle(
                color: lightColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
