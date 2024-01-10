import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.valueEC,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController valueEC;
  final FocusNode focusNode;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: valueEC,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (text) {
        if (text!.isEmpty) {
          return 'Este campo não pode ser vazio';
        }
        if (int.parse(text) < 1000) {
          return 'O valor deve ser maior que 1000';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
