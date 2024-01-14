import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../shared/enum/property_type.dart';
import '../../../shared/util/brazilian_states.dart' as bs;
import '../../../shared/util/routes_app.dart';
import '../../../shared/util/snackBarCustom/snackBarCustom.dart';
import '../../../shared/util/theme/colors_app.dart';
import '../../../shared/widget/app_bar/app_bar_custom.dart';
import '../../../shared/widget/button/button_custom.dart';
import '../../../shared/widget/dropdown/dropdown_custom.dart';
import '../model/analysis.dart';
import '../widget/button_select_custom.dart';
import '../widget/text_form_field_analysis.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({super.key});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  PropertType? _propertType;
  bs.State? _state;
  double _averageValueInvoice = 0;

  void _save() {
    if (_propertType == null || _state == null || _averageValueInvoice == 0 || _averageValueInvoice < 1000) {
      String message = '';

      if(_averageValueInvoice != 0 && _averageValueInvoice < 1000) {
        message = 'O valor médio da conta deve ser maior que R\$ 1.000,00.';
      } else {
        message = 'Preencha todos os campos para continuar.';
      }

      var snackBar = SnackBarCustom(
        title: 'Ops!',
        message: message,
        contentType: ContentType.warning,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }

    Analysis analysis = Analysis(
      averageValueInvoice: _averageValueInvoice,
      propertType: _propertType!,
      state: _state!,
    );

    Modular.to.pushNamed(
      RoutesApp.AnalysisChooseOffert,
      arguments: analysis,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarCustom(shadow: false),
      body: Container(
        color: ColorsApp.white,
        width: double.infinity,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 5, left: 25, bottom: 40),
              decoration: const BoxDecoration(
                color: ColorsApp.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                      color: ColorsApp.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Olá, ',
                    ),
                    TextSpan(
                      text: 'vamos',
                      style: TextStyle(
                        color: ColorsApp.secondary,
                      ),
                    ),
                    TextSpan(
                      text: ' fazer a sua analise.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selecione o tipo de imóvel:',
                    style: TextStyle(
                      color: ColorsApp.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: width <= 320 ? 290 : 310,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonSelectCustom(
                            name: 'Casa',
                            icon: Icon(
                              PhosphorIcons.regular.houseLine,
                              color: ColorsApp.primary,
                              size: 30.0,
                            ),
                            selected: _propertType == PropertType.house,
                            onTap: () {
                              setState(() {
                                _propertType = PropertType.house;
                              });
                            },
                          ),
                          ButtonSelectCustom(
                            name: 'Empresa',
                            icon: Icon(
                              PhosphorIcons.regular.buildings,
                              color: ColorsApp.primary,
                              size: 30.0,
                            ),
                            selected: _propertType == PropertType.company,
                            onTap: () {
                              setState(() {
                                _propertType = PropertType.company;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Estado:',
                    style: TextStyle(
                      color: ColorsApp.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownCustom<bs.State>(
                    items: bs.BrazilianStates.getStateList(),
                    hintText: 'Selecione o estado',
                    onChanged: (value) {
                      _state = value;
                    },
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        PhosphorIcons.regular.lightning,
                        color: ColorsApp.primary,
                        size: 30.0,
                      ),
                      const SizedBox(width: 5),
                      const Flexible(
                        child: Text(
                          'Insira o valor médio da sua conta de energia:',
                          style: TextStyle(
                            color: ColorsApp.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextFormFieldAnalysis(
                      onChanged: (value) {
                        _averageValueInvoice = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: SizedBox(
                      width: 250,
                      child: ButtonCustom(
                        label: 'Procurar ofertas',
                        onPressed: _save,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
