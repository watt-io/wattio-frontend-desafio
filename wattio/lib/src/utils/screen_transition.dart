import 'package:flutter/material.dart';

void fadeNavigate(BuildContext context, Widget nextScreen, {int? animationDuration}) {
  Navigator.of(context).push(PageRouteBuilder(
    transitionDuration:  Duration(milliseconds: animationDuration ?? 600),
    pageBuilder: (_, __, ___) => nextScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return FadeTransition(
        opacity: curvedAnimation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1.0).animate(curvedAnimation),
          child: child,
        ),
      );
    },
  ));
}
