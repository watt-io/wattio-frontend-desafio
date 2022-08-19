import 'package:flutter/material.dart';

class ButtonGroupChangeValueWidget extends StatefulWidget {
  const ButtonGroupChangeValueWidget({
      Key? key, 
      this.onIncrease, 
      this.onDecreasing,
    }) : super(key: key);
  final void Function(int)? onIncrease;
  final void Function(int)? onDecreasing;

  @override
  State<ButtonGroupChangeValueWidget> createState() => 
      _ButtonGroupChangeValueWidgetState();
}

class _ButtonGroupChangeValueWidgetState 
extends State<ButtonGroupChangeValueWidget> {
  bool isIncreasingPressed = false;

  bool isDecreasingPressed = false;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: 38,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => widget.onIncrease?.call(5),
            onLongPressStart: (_) async {
              setState(() => isIncreasingPressed = true);
              do {
                widget.onIncrease?.call(5);
                await Future.delayed(const Duration(milliseconds: 60));
              } while (isIncreasingPressed);
            },
            onLongPressEnd: (_) => setState(() => isIncreasingPressed = false),
            child: Container(
              height: 28,
              width: 38,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                color: Colors.grey[300],
              ),
              child: Center(
                child: Text('+', 
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context).colorScheme.onSecondary.withAlpha(140),
          ),
          GestureDetector(
            onTap: () => widget.onDecreasing?.call(5),
            onLongPressStart: (_) async {
              setState(() => isDecreasingPressed = true);
              
              do {
                widget.onDecreasing?.call(5);
                await Future.delayed(const Duration(milliseconds: 60));
              } while (isDecreasingPressed);
            },
            onLongPressEnd: (_) => setState(() => isDecreasingPressed = false),
            child: Container(
              height: 28,
              width: 38,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Colors.grey[300],
              ),
              child: Center(
                child: Text('-', 
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
}