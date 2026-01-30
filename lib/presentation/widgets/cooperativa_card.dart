import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/formatters.dart';
import '../../core/models/cooperativa.dart';

class CooperativaCard extends StatefulWidget {
  final int index;
  final Cooperativa cooperativa;
  final double valorConta;
  final VoidCallback onSelect;
  final bool isSelected;
  final bool destaque;
  final VoidCallback onToggleCompare;

  const CooperativaCard({
    super.key,
    required this.index,
    required this.cooperativa,
    required this.valorConta,
    required this.onSelect,
    required this.isSelected,
    required this.onToggleCompare,
    this.destaque = false,
  });

  @override
  State<CooperativaCard> createState() => _CooperativaCardState();
}

class _CooperativaCardState extends State<CooperativaCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: 90 * widget.index), () {
      if (!mounted) return;
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final economiaLiquida = widget.cooperativa.calcularEconomiaLiquida(
      widget.valorConta,
    );
    final economiaAnual = economiaLiquida * 12;
    final economiaPercentual = widget.valorConta > 0
        ? economiaLiquida / widget.valorConta
        : widget.cooperativa.desconto;
    final theme = Theme.of(context);

    final badgeColor = widget.destaque
        ? AppColors.secondary.withOpacity(0.2)
        : Colors.white;
    final borderColor = widget.destaque
        ? AppColors.secondary
        : Colors.transparent;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Semantics(
          button: true,
          label:
              'Cooperativa ${widget.cooperativa.nome}, economia mensal ${formatCurrency(economiaLiquida)} com ${formatPercent(economiaPercentual, decimals: 1)}',
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: borderColor, width: 1.2),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: widget.onSelect,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.secondary.withOpacity(0.95),
                                AppColors.primary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.energy_savings_leaf,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.cooperativa.nome,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.cooperativa.modalidade,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.destaque)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: badgeColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              'Melhor economia ${formatPercent(economiaPercentual, decimals: 1)}',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              formatPercent(widget.cooperativa.desconto),
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.cooperativa.descricao,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Conta informada: ${formatCurrency(widget.valorConta)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Faixa: ${formatRange(widget.cooperativa.valorMinimoMensal, widget.cooperativa.valorMaximoMensal)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        _StatPill(
                          label: 'Economia/mês',
                          value: formatCurrency(economiaLiquida),
                        ),
                        const SizedBox(width: 12),
                        _StatPill(
                          label: 'Economia/ano',
                          value: formatCurrency(economiaAnual),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Text(
                          'Ver detalhes',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.primary,
                        ),
                        const Spacer(),
                        FilterChip(
                          label: const Text('Comparar'),
                          selected: widget.isSelected,
                          selectedColor: AppColors.primary.withOpacity(0.15),
                          onSelected: (_) => widget.onToggleCompare(),
                          showCheckmark: false,
                          avatar: Icon(
                            widget.isSelected
                                ? Icons.check_circle
                                : Icons.compare_arrows,
                            color: AppColors.primary,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  final String value;

  const _StatPill({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
