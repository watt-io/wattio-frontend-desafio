import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../util/theme/colors_app.dart';

class DropdownCustom<T> extends StatefulWidget {
  final String? hintText;
  final List<T> items;
  final void Function(T?)? onChanged;

  const DropdownCustom({
    this.hintText,
    required this.items,
    this.onChanged,
    super.key,
  });

  @override
  State<DropdownCustom<T>> createState() => DropdownCustomState<T>();
}

class DropdownCustomState<T> extends State<DropdownCustom<T>> {
  @override
  Widget build(BuildContext context) {
    return CustomDropdown<T>(
      hintText: widget.hintText,
      items: widget.items,
      decoration: const CustomDropdownDecoration(
        headerStyle: TextStyle(
          color: ColorsApp.black,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        listItemStyle: TextStyle(
          color: ColorsApp.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        closedBorder: Border.fromBorderSide(
          BorderSide(
            color: ColorsApp.gray2,
            width: 0.5,
          ),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
