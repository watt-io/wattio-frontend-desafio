import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:wattio/src/modules/controller/business_controller.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/modules/model/business_model.dart';
import 'package:wattio/src/pages/home/components/audience_selector.dart';
import 'package:wattio/src/pages/matched_cooperatives/matched_cooperatives.dart';
import 'package:wattio/src/utils/app_theme.dart';
import 'package:wattio/src/utils/custom_text_theme.dart';
import 'package:wattio/src/utils/full_screen_loading.dart';
import 'package:wattio/src/utils/screen_size.dart';
import 'package:wattio/src/utils/screen_transition.dart';

class MonthlyMediumSpending extends StatefulWidget {
  const MonthlyMediumSpending({super.key});

  @override
  State<MonthlyMediumSpending> createState() => _MonthlyMediumSpendingState();
}

class _MonthlyMediumSpendingState extends State<MonthlyMediumSpending> {
  TextEditingController _spendingController = TextEditingController();
  AudienceType audienceType = AudienceType.pf;
  bool _hasError = false;
  String _errorMessage = '';

  setAudienceType(AudienceType type) {
    setState(() {
      audienceType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 150,
                        child: Image.asset('assets/icons/bottom_icon.png'),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        AppText(
                          text: 'Insira seu gasto médio mensal de energia:',
                          size: 28,
                          maxLines: 3,
                          color: WattioColors.secondaryContainer,
                          weight: FontWeight.bold,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 50),
                          child: TextField(
                            onTap: () {
                              setState(() {
                                _hasError = false;
                              });
                            },
                            keyboardType: TextInputType.number,
                            controller: _spendingController,
                            style: TextStyle(
                              color: WattioColors.onTertiary,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            inputFormatters: [
                              CurrencyInputFormatter(
                                useSymbolPadding: true,
                                thousandSeparator: ThousandSeparator.Period,
                              ),
                            ],
                            decoration: InputDecoration(
                              errorText: _hasError ? _errorMessage : null,
                              errorStyle: TextStyle(fontSize: 12),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color:
                                      _hasError
                                          ? Colors.red
                                          : Theme.of(context).primaryColor,
                                ),
                              ),
                              hintText: '1.000,00',
                              isDense: true,
                              prefixIcon: Container(
                                width: 10,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 5,
                                ),
                                child: AppText(
                                  text: 'R\$',
                                  color: WattioColors.onTertiary,
                                  size: 16,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: WattioColors.secondaryContainer,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AudienceSelector(setAudienceType: setAudienceType),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: SizedBox(
                            width: ScreenSize.width(context) / 1.3,
                            height: 50,
                            child: ElevatedButton(
                              onPressed:
                                  () => findBusinessLocal(
                                    audience: audienceType,
                                    spendingValue: _spendingController.text,
                                  ),
                              child: AppText(
                                text: 'Ver Ofertas',
                                color: WattioColors.primary,
                                weight: FontWeight.bold,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  findBusinessLocal({
    required AudienceType audience,
    required String spendingValue,
  }) async {
    showFullScreenLoadingWithText(
      context,
      'Estamos buscando as melhores ofertas na velocidade da luz!',
    );

    if (spendingValue.isEmpty || spendingValue == '0,00') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: WattioColors.error,
          content: AppText(
            text: 'Preencha o valor do gasto mensal!',
            color: WattioColors.onTertiary,
          ),
        ),
      );
      Navigator.pop(context);
      return;
    }

    String cleaned = spendingValue.replaceAll('.', '').replaceAll(',', '.');
    double doubleValue = double.tryParse(cleaned) ?? 0.0;

    int spendingValueCleaned = doubleValue.round();

    List<BusinessModel> result = await findBusiness(
      userType: audience,
      monthlySpend: spendingValueCleaned,
    );

    Navigator.pop(context);

    if (result.isEmpty || result == []) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Não encontramos cooperativas que aceitem esse valor.';
      });
      return;
    }
    fadeNavigate(
      context,
      MatchedCooperatives(
        matchedBusiness: result,
        consumerSpending: spendingValueCleaned,
        audienceType: audience,
      ),
      animationDuration: 300,
    );
  }
}
