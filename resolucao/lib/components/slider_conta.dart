import 'package:desafio_wattio/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SliderConta extends StatelessWidget {
  final double valor;
  final ValueChanged<double> onChanged;

  const SliderConta({required this.valor, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const min = 1000.0;
    const max = 100000.0;
    final step = 250;

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: AppColors.orange,
        inactiveTrackColor: AppColors.green,
        thumbColor: AppColors.orange,
        overlayColor: AppColors.orange.withValues(alpha: 0.12),
        trackHeight: 4  ,
      ),
      child: Slider(
        min: min,
        max: max,
        divisions: ((max - min) / step).round(),
        value: valor.clamp(min, max),
        onChanged: onChanged,
      ),
    );
  }
}
