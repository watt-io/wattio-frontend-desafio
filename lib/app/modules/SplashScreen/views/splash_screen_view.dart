import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio_offkevyn/app/shared/util/theme/imgs_app.dart';

import '../../../shared/util/theme/colors_app.dart';
import '../bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_events.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  late SplashScreenBloc _splashScreenBloc;

  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;

  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();

    _splashScreenBloc = SplashScreenBloc();
    _splashScreenBloc.add(OnLoadingEvent());

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(
      _animationController,
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) _animationCompleted = true;
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double heightIamge = 168;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: ColorsApp.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
            top: _animationController.value * (height / 2) - (heightIamge / 2),
            right: 0,
            left: 0,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SizedBox(
                width: 200,
                child: Image.asset(
                  ImgsApp.logo2,
                  fit: BoxFit.contain,
                  width: 200,
                  height: heightIamge,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
