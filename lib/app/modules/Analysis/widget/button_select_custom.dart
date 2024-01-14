import 'package:flutter/material.dart';

import '../../../shared/util/theme/colors_app.dart';


class ButtonSelectCustom extends StatefulWidget {
  final String name;
  final Icon icon;
  final bool selected;
  final void Function() onTap;

  const ButtonSelectCustom({
    required this.name,
    required this.icon,
    required this.onTap,
    bool? selected,
    super.key,
  }) : selected = selected ?? false;

  @override
  State<ButtonSelectCustom> createState() => BbuttoSselecCcustomState();
}

class BbuttoSselecCcustomState extends State<ButtonSelectCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        // duration: const Duration(milliseconds: 300),
        width: 140,
        height: 50,
        decoration: BoxDecoration(
          color: widget.selected
              ? ColorsApp.primary.withOpacity(0.10)
              : ColorsApp.white,
          border: Border.all(
            color: ColorsApp.gray2,
            width: 0.25,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorsApp.gray.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(width: 10),
            Text(
              widget.name,
              style: const TextStyle(
                color: ColorsApp.primary,
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
