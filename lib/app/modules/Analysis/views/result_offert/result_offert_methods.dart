part of 'result_offert_view.dart';

late ResultOffertBloc _resultOffertBloc;

void _resultOffertBlocListener({
  required ResultOffertState state,
  required BuildContext context,
}) {
  if (state is ResultOffertSuccessState) {
    var snackBar = SnackBarCustom(
      title: 'Sucesso!',
      message: 'Sua oferta foi calculada com sucesso.',
      contentType: ContentType.success,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else if (state is ResultOffertFailedState) {
    var snackBar = SnackBarCustom(
      title: 'Error!',
      message: state.message,
      contentType: ContentType.failure,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Widget _succsses({required ResultOffert resultOffert}) {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 15,
          right: 15,
          bottom: 15,
        ),
        child: RichText(
          text: const TextSpan(
            text: 'Aqui está o seu ',
            style: TextStyle(
              color: ColorsApp.primary,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: 'resultado',
                style: TextStyle(
                  color: ColorsApp.secondary,
                ),
              ),
              TextSpan(
                text: '!!',
              ),
            ],
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
      UnconstrainedBox(
        child: CardOffert(
          cooperative: resultOffert.cooperative,
          index: 1,
        ),
      ),
      const SizedBox(height: 35),
      UnconstrainedBox(
        child: Container(
          width: 300,
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorsApp.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'Sua economia anual será de até:',
                style: TextStyle(
                  color: ColorsApp.primary,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                _formatCurrency(resultOffert.annualSavings),
                style: const TextStyle(
                  color: ColorsApp.primary2,
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 17),
              const Divider(
                color: ColorsApp.primary,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Em média ',
                  style: const TextStyle(
                    color: ColorsApp.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: _formatCurrency(resultOffert.annualSavings / 12),
                      style: const TextStyle(
                        color: ColorsApp.primary2,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextSpan(
                      text: ' por mês*',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                '*Essa é apenas uma simulação e não configura garantia do desconto.',
                style: TextStyle(
                  color: ColorsApp.black,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 80),
      UnconstrainedBox(
        child: SizedBox(
          width: 250,
          child: ButtonCustom(
            label: 'Contratar',
            onPressed: () {
              _resultOffertBloc.add(HandleAcceptOffertEvent());
            },
          ),
        ),
      ),
      const SizedBox(height: 50),
    ],
  );
}

_congratulations({
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
              width: width * 0.75,
              child: const Text(
                'Parabéns, em breve iremos entrar em contato!! ',
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
                'assets/lottie/congratulations.json',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: ButtonCustom(
                label: 'Voltar ao início',
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

String _formatCurrency(double value) {
  final currencyFormatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormatter.format(value);
}
