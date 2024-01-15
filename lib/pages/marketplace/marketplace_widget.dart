import 'package:desafio_wattio/global/theme_controller.dart';
import 'package:desafio_wattio/models/cooperative_model.dart';
import 'package:desafio_wattio/pages/cooperative/cooperative_page.dart';
import 'package:desafio_wattio/pages/cooperative/store/cooperative_store.dart';
import 'package:desafio_wattio/pages/marketplace/marketplace_page.dart';
// import 'package:desafio_wattio/marketplace.dart';
import 'package:desafio_wattio/pages/marketplace/store/marketplace_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketplaceWidget {
  BuildContext context;
  MarketplaceWidget(this.context);

  Widget widgetPrincipal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ListView(
        children: [
          _header(context),
          _textField(context),
          _cooperativeList(context),
        ],
      ),
    );
  }

  Widget _header(context) {
    Size screenSize = MediaQuery.of(context).size;

    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Column(
      children: [   
        Container(
          color: globalsThemeVar.themeColors.secondaryBackgroundColor,
          width: screenSize.width,
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Calcule a ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: globalsThemeVar.themeColors.secondaryTextColor,
                      ),
                    ),
                    TextSpan(
                      text: 'economia ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: globalsThemeVar.themeColors.tertiaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'da sua empresa!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: globalsThemeVar.themeColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                padding: const EdgeInsets.only(bottom: 30, top: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Preencha o campo abaixo com o',
                        style: TextStyle(
                          color: globalsThemeVar.themeColors.secondaryTextColor,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: ' valor médio mensal ',
                        style: TextStyle(
                          color: globalsThemeVar.themeColors.tertiaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text:
                            'da sua conta de energia e veja as cooperativas disponíveis para você, junto com os',
                        style: TextStyle(
                          color: globalsThemeVar.themeColors.secondaryTextColor,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: ' descontos exclusivos! 😜',
                        style: TextStyle(
                          color: globalsThemeVar.themeColors.tertiaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textField(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final marketplaceStore = Provider.of<MarketplaceStore>(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
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
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: TextField(
              cursorColor: globalsThemeVar.themeColors.tertiaryColor,
              style: TextStyle(
                color: globalsThemeVar.themeColors.secondaryTextColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: Icon(
                  FontAwesomeIcons.bolt,
                  color: globalsThemeVar.themeColors.tertiaryColor,
                  size: 25,
                ),
                border: InputBorder.none,
              ),
              controller: marketplaceStore.valueController,
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                marketplaceStore.formChanged(value);
                marketplaceStore.toggleOffersVisibleFlag();
                marketplaceStore.updateOffers();
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Atenção: ',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.tertiaryColor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
              TextSpan(
                text:
                    'Valor mínimo permitido de ${marketplaceStore.valueFormat.format(marketplaceStore.valueMin)} e máximo de ${marketplaceStore.valueFormat.format(marketplaceStore.valueMax)}.',
                style: TextStyle(
                  color: globalsThemeVar.themeColors.secondaryColor,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cooperativeList(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final marketplaceStore = Provider.of<MarketplaceStore>(context);

    return Visibility(
      visible: marketplaceStore.offersVisibleFlag,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cooperativas Disponíveis',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: globalsThemeVar.themeColors.secondaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Material(
                  color: globalsThemeVar.themeColors.secondaryBackgroundColor,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.filter,
                          color: globalsThemeVar.themeColors.secondaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          for (var offer in marketplaceStore.offers) cooperativeCard(offer),
        ],
      ),
    );
  }

  Widget cooperativeCard(offer) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final marketplaceStore = Provider.of<MarketplaceStore>(context);
    final cooperativeStoreT =
        Provider.of<CooperativeStore>(context, listen: true);

    return Card(
      color: globalsThemeVar.themeColors.primaryColor,
      shadowColor: globalsThemeVar.themeColors.shadedColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            cooperativeStoreT.setCoopSelec(offer);
            cooperativeStoreT.setValueSelec(marketplaceStore.value);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CooperativePage()));
          },
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRichText('Cooperativa:  ', offer.nome),
                    buildRichText('Desconto:  ',
                        '${(offer.desconto * 100).toStringAsFixed(2)}%'),
                    buildRichText('Contato:  ', offer.contato),
                    buildRichText('Contrato:  ', offer.contrato),
                    buildRichText('Modelo:  ', offer.modelo),
                  ],
                ),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  color: globalsThemeVar.themeColors.secondaryTextColor,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRichText(String label, String value) {
    Size screenSize = MediaQuery.of(context).size;

    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return SizedBox(
      width: screenSize.width * 0.65,
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              color: globalsThemeVar.themeColors.secondaryTextColor,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: globalsThemeVar.themeColors.secondaryTextColor,
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
