import 'package:flutter/material.dart';

import '../../util/theme/colors_app.dart';
import '../progress/progress_custom.dart';

enum Variant { contained, outlined }

class ButtonCustom extends StatelessWidget {
  final Color _primaryColor = ColorsApp.primary;
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  ButtonStyle _defaultStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    shape:  MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    )
  );
  Variant variant;
  final IconData? prefix;
  final IconData? sufix;

  ButtonCustom({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.variant = Variant.contained,
    ButtonStyle? style,
    this.prefix,
    this.sufix,
  }) {
    if (variant == Variant.contained) {
      _defaultStyle = _defaultStyle.merge(ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_primaryColor),
          foregroundColor: MaterialStateProperty.all(Colors.white)));
    } else {
      _defaultStyle = _defaultStyle.merge(ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return _primaryColor; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white; //<-- SEE HERE
              }
              return _primaryColor; // Defer to the widget's default.
            },
          ),
          side: MaterialStateProperty.all(
              BorderSide(color: _primaryColor, width: 1.5))));
    }

    if (style != null) {
      _defaultStyle = style.merge(_defaultStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: loading ? () {} : onPressed,
        style: _defaultStyle.copyWith(
          backgroundColor:
              loading ? MaterialStateProperty.all(Colors.grey) : null,
        ),
        child: loading
            ? const ProgressCustom()
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                prefix != null ? Icon(prefix) : const SizedBox(),
                prefix != null
                    ? const SizedBox(
                        width: 8,
                      )
                    : const SizedBox(),
                Text(label, style: const TextStyle(fontSize: 18)),
                sufix != null ? Icon(sufix) : const SizedBox(),
                sufix != null
                    ? const SizedBox(
                        width: 8,
                      )
                    : const SizedBox(),
              ]),
      ),
    );
  }
}
