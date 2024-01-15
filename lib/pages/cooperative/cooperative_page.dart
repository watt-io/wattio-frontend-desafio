import 'package:desafio_wattio/global/theme_controller.dart';
import 'package:desafio_wattio/pages/cooperative/cooperative_widget.dart';
import 'package:desafio_wattio/pages/cooperative/store/cooperative_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CooperativePage extends StatefulWidget {
  const CooperativePage({super.key});

  @override
  State<CooperativePage> createState() => _CooperativePageState();
}

class _CooperativePageState extends State<CooperativePage> {
  late GlobalsThemeVar globalsThemeVar;
  late CooperativeStore cooperativeStore;

  //declaração APENAS das variaveis necessárias, o restante deve ser declarado na functions ou store
  bool entrouIniciaPage = false;

  @override
  void didChangeDependencies() {
    globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    cooperativeStore = Provider.of<CooperativeStore>(context);

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
              child: CooperativeWidget(context).widgetPrincipal(),
            ),
          )),
    );
  }
}
