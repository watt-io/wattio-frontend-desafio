part of 'choose_offert_view.dart';

late ChooseOffertBloc _chooseOffertBloc;
late Analysis _analysis;

void _chooseOffertBlocListener({
  required ChooseOffertState state,
  required BuildContext context,
}) {
  if (state is ChooseOffertSuccessState) {
    var snackBar = SnackBarCustom(
      title: 'Sucesso!',
      message: 'Foi encontrado ${state.listCooperative.length} ofertas.',
      contentType: ContentType.success,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (state is ChooseOffertFailedState) {
    var snackBar = SnackBarCustom(
      title: 'Error!',
      message: state.message,
      contentType: ContentType.failure,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Widget _succsses({required List<Cooperative> listCooperative}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        child: Text(
          'Oh, essas foram as ofertas que achamos para você. ',
          style: TextStyle(
            color: ColorsApp.primary,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 3,
            color: ColorsApp.primary,
            width: double.infinity,
          ),
          Image.asset(
            ImgsApp.iconWattio,
            height: 35,
            // width: 30,
          ),
        ],
      ),
      const SizedBox(height: 20),
      const Center(
        child: Text(
          'Selecione a oferta ideal para você: ',
          style: TextStyle(
            color: ColorsApp.primary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 25),
      Expanded(
        child: ListView.separated(
          itemCount: listCooperative.length,
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemBuilder: (context, index) {
            return _itemList(cooperative: listCooperative[index], index: index);
          },
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}

Widget _itemList({required Cooperative cooperative, required int index}) {
  return UnconstrainedBox(
    child: InkWell(
      onTap: () {
        Modular.to.pushNamed(
          RoutesApp.AnalysisResultOffert,
          arguments: {
            'analysis': _analysis,
            'cooperative': cooperative,
          },
        );  
      },
      child: Ink(
        child: CardOffert(cooperative: cooperative, index: index + 1),
      ),
    ),
  );
}

_empty({
  required Orientation orientation,
  required double height,
  required double width,
}) {
  bool isPortrait = orientation == Orientation.portrait;

  return Center(
    child: SingleChildScrollView(
      child: SizedBox(
        // height: isPortrait ? height * 0.6 : height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: width * 0.90,
              child: const Text(
                'Não encontramos nenhuma oferta para você, tente novamente!!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: isPortrait ? width * 0.75 : width * 0.4,
              child: Lottie.asset(
                'assets/lottie/empty.json',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: ButtonCustom(
                label: 'Tentar novamente',
                variant: Variant.outlined,
                onPressed: () {
                  Modular.to.navigate(
                    RoutesApp.Analysis,
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    ),
  );
}
