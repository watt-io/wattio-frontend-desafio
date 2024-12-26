import 'package:energy_marketplace/main.dart';
import 'package:energy_marketplace/pages/models/company_model.dart';
import 'package:energy_marketplace/pages/shared/widgets/custom_text_field.dart';
import 'package:energy_marketplace/pages/widgets/company_card.dart';
import 'package:energy_marketplace/pages/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final _formKey = GlobalKey<FormState>();
  final valueEC = TextEditingController();
  late FocusNode focusNode;
  Set<CompanyModel> displayedModels = {};
  double savingPerYear = 0.0;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  List<CompanyModel> model = (jsonMap['company'] as List<dynamic>)
      .map((e) => CompanyModel.fromMap(Map<String, dynamic>.from(e)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Insira o valor médio mensal da sua conta de energia',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            valueEC: valueEC,
            focusNode: focusNode,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'CALCULAR',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _handleEnergy();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          if (displayedModels.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Selecione uma das Cooperativas de Energia para simular sua economia com base no desconto.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          Column(
            children: [
              ListView.builder(
                itemCount: displayedModels.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  CompanyModel currentModel = displayedModels.elementAt(index);

                  return CompanyCard(
                    currentModel: currentModel,
                    displayedModels: displayedModels,
                    onPressed: () {
                      setState(() {
                        for (var model in displayedModels) {
                          model.isSelected = false;
                        }
                        currentModel.isSelected = true;
                      });
                    },
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'CALCULAR ECONOMIA',
                    isDisabled:
                        displayedModels.isEmpty || !isOneModelSelected(),
                    onPressed: () {
                      if (displayedModels.isEmpty) {
                        return;
                      }

                      _calculateSaving();
                    },
                  ),
                ),
              ],
            ),
          ),
          if (savingPerYear != 0)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Minha economia anual é:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              wordSpacing: 2,
                            ),
                          ),
                          Text(
                            'R\$ ${_formatNumber(savingPerYear)}',
                            style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Será economizado ",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'R\$ ${_formatNumber(savingPerYear / 12)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' por mês',
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  String _formatNumber(double number) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return formatter.format(number);
  }

  _calculateSaving() {
    CompanyModel selectedModel = displayedModels.firstWhere(
      (e) => e.isSelected,
    );

    double energyValue = double.parse(valueEC.text);

    double totalPerYear = energyValue * 12;
    double annualSaving = totalPerYear * selectedModel.desconto;

    setState(() {
      savingPerYear = annualSaving;
    });
  }

  _handleEnergy() {
    double energyValue = double.parse(valueEC.text);

    displayedModels.clear();

    for (var i = 0; i < model.length; i++) {
      if (energyValue >= model[i].valorMinMensal &&
          energyValue <= model[i].valorMaxMensal) {
        displayedModels.add(model[i]);
      }
    }
    for (var model in displayedModels) {
      model.isSelected = false;
    }

    setState(() {});
  }

  bool isOneModelSelected() {
    for (var model in displayedModels) {
      if (model.isSelected) {
        return true;
      }
    }
    return false;
  }
}
