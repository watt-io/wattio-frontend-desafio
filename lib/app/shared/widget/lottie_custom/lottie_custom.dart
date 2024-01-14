import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../util/theme/colors_app.dart';


class LottieCustom extends StatefulWidget {
  final LottieType lottieType;
  const LottieCustom({required this.lottieType, super.key});

  @override
  State<LottieCustom> createState() => LottieCustomState();
}

class LottieCustomState extends State<LottieCustom> {
  late double height;
  late double width;
  late bool isPortrait;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    });

    return SizedBox(
      height: isPortrait ? height * 0.6 : height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _content(lottieType: widget.lottieType),
        ),
      ),
    );
  }

  List<Widget> _content({required LottieType lottieType}) {
    switch (lottieType) {
      case LottieType.empty:
        return [
          SizedBox(
            width: isPortrait ? width * 0.75 : width * 0.4,
            child: Lottie.asset(
              'assets/lottie/empty.json',
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Nenhum item encontrado',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsApp.primary.withOpacity(0.6),
            ),
          ),
        ];
      case LottieType.failed:
        return [
          SizedBox(
            width: isPortrait ? width * 0.75 : width * 0.4,
            child: Lottie.asset(
              'assets/lottie/erro.json',
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Ocorreu um erro!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsApp.red,
            ),
          ),
        ];
      case LottieType.loading:
        return [
          SizedBox(
            width: isPortrait ? width * 0.75 : width * 0.4,
            child: Lottie.asset(
              'assets/lottie/loading.json',
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            'Carregando...',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ColorsApp.primary,
            ),
          ),
        ];
      default:
        return [];
    }
  }
}

enum LottieType { empty, failed, loading }
