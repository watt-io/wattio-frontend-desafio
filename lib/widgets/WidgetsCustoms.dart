import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WidgetsCustoms {
  AppBar appBar(BuildContext context, String text,
      {bool showBackPress = false}) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: showBackPress
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/infoScreen'),
            )
          : null,
      title: Row(children: [
        SvgPicture.asset(
          width: 25,
          'assets/logo-amarelo.svg',
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text, style: const TextStyle(color: Colors.white))
      ]),
    );
  }

  Text textSize25(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  Future<void> dialogBuilder(
      BuildContext context, String title, String description) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          content: Text(
            description,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
