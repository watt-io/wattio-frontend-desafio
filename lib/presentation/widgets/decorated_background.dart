import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DecoratedBackground extends StatelessWidget {
  final Widget child;

  const DecoratedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fundo com gradiente + circulos para dar profundidade visual.
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.background, Color(0xFFF7F7E1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned(
          top: -120,
          right: -60,
          child: _GlowCircle(
            size: 220,
            color: AppColors.secondary.withOpacity(0.24),
          ),
        ),
        Positioned(
          bottom: -140,
          left: -40,
          child: _GlowCircle(
            size: 240,
            color: AppColors.tertiary.withOpacity(0.18),
          ),
        ),
        Positioned(
          top: 120,
          left: -30,
          child: _GlowCircle(
            size: 120,
            color: AppColors.primary.withOpacity(0.12),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
