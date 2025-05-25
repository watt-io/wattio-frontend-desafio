import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/modules/model/business_model.dart';
import 'package:wattio/src/pages/congrats_screen/congrats_screen.dart';
import 'package:wattio/src/pages/home/components/convert_percent_pattern.dart';
import 'package:wattio/src/pages/home/components/monthly_discout_calculator.dart';
import 'package:wattio/src/utils/app_theme.dart';
import 'package:wattio/src/utils/custom_text_theme.dart';
import 'package:wattio/src/utils/screen_size.dart';
import 'package:wattio/src/utils/screen_transition.dart';

import '../home/components/discount_calculator.dart';

class MatchedCooperatives extends StatefulWidget {
  const MatchedCooperatives({
    super.key,
    required this.matchedBusiness,
    required this.consumerSpending,
    required this.audienceType,
  });

  final List<BusinessModel> matchedBusiness;
  final int consumerSpending;
  final AudienceType audienceType;

  @override
  State<MatchedCooperatives> createState() => _MatchedCooperativesState();
}

class _MatchedCooperativesState extends State<MatchedCooperatives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: WattioColors.secondaryContainer),
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: AppText(
                  text:
                      'Confira as opções para ${getAudienceLabel(widget.audienceType)}',
                  color: WattioColors.onTertiary,
                  size: 25,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: ScreenSize.height(context) / 2.5,
                  child: PageView.builder(
                    itemCount: widget.matchedBusiness.length,
                    controller: PageController(viewportFraction: 0.85),
                    itemBuilder: (context, index) {
                      var business = widget.matchedBusiness[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          elevation: 8,
                          child: SingleChildScrollView(
                            child: IntrinsicHeight(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            AppText(
                                              text: 'Cooperativa: ',
                                              size: 14,
                                            ),
                                            AppText(
                                              text: business.name,
                                              weight: FontWeight.bold,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppText(text: 'Economia de: '),
                                            AppText(
                                              text: formatDiscountPercentage(
                                                business.discount,
                                              ),
                                              weight: FontWeight.bold,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: ScreenSize.width(context),
                                    decoration: BoxDecoration(
                                      color: WattioColors.surfaceTint,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                          text: 'MINHA ECONOMIA ANUAL SERÁ DE ATÉ:',
                                          maxLines: 2,
                                          color: WattioColors.onTertiary,
                                        ),
                                        AppText(
                                          text: setDiscountValue(
                                            discountValue: business.discount,
                                            consumerSpending:
                                                widget.consumerSpending,
                                          ),
                                          size: 30,
                                          color: WattioColors.secondaryContainer,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppText(
                                    text:
                                        'Em média de ${calculateMontlhyDiscount(discountValue: business.discount, consumerSpending: widget.consumerSpending)} por mês*',
                                    maxLines: 4,
                                    size: 14,
                                  ),
                              
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: SizedBox(
                                      width: ScreenSize.width(context) / 1.5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          fadeNavigate(
                                            context,
                                            CongratsScreen(
                                              chosenCooperative: business.name,
                                              annualEconomy: setDiscountValue(
                                                discountValue: business.discount,
                                                consumerSpending:
                                                    widget.consumerSpending,
                                              ),
                                              monthlyEconomy:
                                                  calculateMontlhyDiscount(
                                                    discountValue:
                                                        business.discount,
                                                    consumerSpending:
                                                        widget.consumerSpending,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: AppText(
                                          text: 'Quero Contratar Este',
                                          weight: FontWeight.bold,
                                          color: WattioColors.surfaceTint,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AppText(
                  text:
                      '*Essa é apenas uma simulação e não configura garantia de desconto.',
                  color: WattioColors.onTertiary,
                  size: 13,
                  maxLines: 2,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: AppText(
                            text: 'Recalcular Ofertas',
                            color: WattioColors.surfaceTint,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 150,
                    child: Image.asset('assets/icons/bottom_icon.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
