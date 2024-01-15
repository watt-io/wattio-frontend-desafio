import 'package:desafio_wattio/global/theme_controller.dart';
import 'package:desafio_wattio/pages/cooperative/store/cooperative_store.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CooperativeWidget {
  BuildContext context;
  CooperativeWidget(this.context);

  Widget widgetPrincipal() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            _appBar(context),
            _discount(context),
          ],
        ),
      ),
    );
  }

  Widget _appBar(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.chevron_left,
            color: globalsThemeVar.themeColors.secondaryColor,
            size: 40,
          ),
        ),
      ],
    );
  }

  Widget _discount(context) {
    Size screenSize = MediaQuery.of(context).size;

    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final cooperativeStore = Provider.of<CooperativeStore>(context);

    final mensalDiscount =
        cooperativeStore.valueSelec * cooperativeStore.coopSelec.desconto;
    final anualTotalValue = (cooperativeStore.valueSelec - mensalDiscount) * 12;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: globalsThemeVar.themeColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: globalsThemeVar.themeColors.shadedColor,
            blurRadius: 10.0,
            spreadRadius: 0.2,
            offset: const Offset(
              1.0,
              2.0,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            cooperativeStore.coopSelec.nome,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: globalsThemeVar.themeColors.secondaryTextColor,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Com seu uso mensal de ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: globalsThemeVar.themeColors.secondaryTextColor,
                    )),
                TextSpan(
                    text: cooperativeStore.valueFormat
                        .format(cooperativeStore.valueSelec),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: globalsThemeVar.themeColors.tertiaryColor,
                    )),
                TextSpan(
                    text: ' você poderá economizar até',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: globalsThemeVar.themeColors.secondaryTextColor,
                    )),
                TextSpan(
                    text:
                        ' ${cooperativeStore.valueFormat.format(mensalDiscount * 12)} por ano',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: globalsThemeVar.themeColors.tertiaryColor,
                    )),
                TextSpan(
                    text: ' contratando os serviços da cooperativa!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: globalsThemeVar.themeColors.secondaryTextColor,
                    )),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: screenSize.width * 0.7,
              height: screenSize.height * 0.4,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 50,
                  sections: [
                    PieChartSectionData(
                      color: globalsThemeVar.themeColors.tertiaryColor,
                      value: mensalDiscount * 12,
                      title: cooperativeStore.valueFormat
                          .format(mensalDiscount * 12),
                      radius: 60,
                      titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: globalsThemeVar.themeColors.primaryTextColor,
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.grey.withOpacity(0.8),
                      value: anualTotalValue,
                      radius: 50,
                      title:
                          cooperativeStore.valueFormat.format(anualTotalValue),
                      titleStyle: TextStyle(
                        fontSize: 12,
                        color: globalsThemeVar.themeColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Gaste menos, economize mais!\n',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: globalsThemeVar.themeColors.secondaryTextColor,
                  ),
                ),
                TextSpan(
                  text: ' Contrate agora e garanta uma economia de até',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: globalsThemeVar.themeColors.tertiaryColor,
                  ),
                ),
                TextSpan(
                  text:
                      ' ${cooperativeStore.valueFormat.format(mensalDiscount)} por mês!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: globalsThemeVar.themeColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => Dialog(
                        backgroundColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Parabéns!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: globalsThemeVar.themeColors.tertiaryColor,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
            },
            child: Text(
              'Quero contratar!',
              style: TextStyle(
                color: globalsThemeVar.themeColors.tertiaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
