import 'package:desafio_wattio/global/theme_controller.dart';
import 'package:desafio_wattio/pages/marketplace/marketplace_widget.dart';
import 'package:desafio_wattio/pages/marketplace/store/marketplace_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  late GlobalsThemeVar globalsThemeVar;
  late MarketplaceStore marketplaceStore;

  //declaração APENAS das variaveis necessárias, o restante deve ser declarado na functions ou store
  bool entrouIniciaPage = false;

  @override
  void didChangeDependencies() {
    globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    marketplaceStore = Provider.of<MarketplaceStore>(context);

    //garante que não vai fazer essa chamada de função novamente depois que a página já foi carregada
    if (!entrouIniciaPage) {
      _iniciaPage();
    }

    super.didChangeDependencies();
  }

  //função principal da pagina que fará todas as chamadas de funcões e carregamentos antes de efetivamente abrir a página
  Future _iniciaPage() async {
    entrouIniciaPage = true;

    // depois de tudo carregado e validado, atualiza a variavel para que a página seja aberta
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: globalsThemeVar.themeColors.secondaryBackgroundColor,
          body: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SafeArea(
              child: MarketplaceWidget(context).widgetPrincipal(),
            ),
          )),
    );
  }
}
