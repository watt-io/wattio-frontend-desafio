import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../util/theme/colors_app.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TextFormFieldCustom extends StatefulWidget {
  TextEditingController? controller;
  void Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  String? initialValue;
  String labelText;
  String hintText;
  bool obligatory;
  bool password;
  bool? enabled;
  BorderType borderType;
  FocusNode? focusNode;

  TextFormFieldCustom({
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.textInputType,
    this.initialValue,
    this.enabled = true,
    String? labelText,
    String? hintText,
    bool? obligatory,
    bool? password,
    BorderType? borderType,
    this.focusNode,
    super.key,
  })  : labelText = labelText ?? '',
        hintText = hintText ?? '',
        obligatory = obligatory ?? false,
        password = password ?? false,
        borderType = borderType ?? BorderType.outline;

  @override
  State<TextFormFieldCustom> createState() => TextFormFieldCustomState();
}

class TextFormFieldCustomState extends State<TextFormFieldCustom> {
  late bool _obscurePassord = widget.password;

  late InputBorder enabledBorder;
  late InputBorder focusedBorder;
  final BorderSide borderSideenabled = BorderSide(
    color: ColorsApp.gray.withAlpha(180),
  );
  final BorderSide borderSidefocused = const BorderSide(
    color: ColorsApp.primary,
    width: 2.0,
  );
  final BorderRadius borderRadiusfocused = BorderRadius.circular(
    5.0,
  );

  @override
  void initState() {
    if (widget.borderType == BorderType.underline) {
      enabledBorder = UnderlineInputBorder(
        borderSide: borderSideenabled,
      );
      focusedBorder = UnderlineInputBorder(
        borderSide: borderSidefocused,
      );
    } else {
      enabledBorder = OutlineInputBorder(
        borderSide: borderSideenabled,
        borderRadius: borderRadiusfocused,
      );
      focusedBorder = OutlineInputBorder(
        borderSide: borderSidefocused,
        borderRadius: borderRadiusfocused,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        key: widget.key,
        controller: widget.controller,
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
        keyboardType: widget.textInputType,
        obscureText: _obscurePassord,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        decoration: InputDecoration(
          hoverColor: Colors.transparent,
          suffixIcon: widget.password
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      _obscurePassord == false
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xFF72747A),
                    ),
                  ),
                  onTap: () => {
                    setState(
                      () {
                        _obscurePassord = !_obscurePassord;
                      },
                    )
                  },
                )
              : null,
          filled: true,
          fillColor: widget.enabled! ? Colors.white : Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            vertical: 9.0,
            horizontal: 10.0,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.labelText),
              Text(
                widget.obligatory ? '*' : '',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
          hintText: widget.hintText,
          labelStyle: const TextStyle(
            color: ColorsApp.gray,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          disabledBorder: enabledBorder,
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
      ),
    );
  }
}

enum BorderType {
  underline,
  outline,
}
