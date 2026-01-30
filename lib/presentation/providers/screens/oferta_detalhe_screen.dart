import 'package:desafio_front_end_wattio/core/models/cooperativa.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/formatters.dart';
import '../../widgets/decorated_background.dart';

class OfertaDetalheScreen extends StatelessWidget {
  final Cooperativa cooperativa;
  final double valorConta;

  const OfertaDetalheScreen(this.cooperativa, this.valorConta, {super.key});

  @override
  Widget build(BuildContext context) {
    final economiaBruta = cooperativa.calcularEconomiaBruta(valorConta);
    final taxaAdministrativa = cooperativa.calcularTaxaAdministrativa(
      valorConta,
    );
    final economiaLiquida = cooperativa.calcularEconomiaLiquida(valorConta);
    final economiaAnual = economiaLiquida * 12;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da oferta')),
      body: DecoratedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.tertiary.withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.22),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oferta aprovada para você',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        cooperativa.nome,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _DetailChip(
                            icon: Icons.percent,
                            label:
                                'Desconto ${formatPercent(cooperativa.desconto)}',
                          ),
                          _DetailChip(
                            icon: Icons.solar_power,
                            label: cooperativa.modalidade,
                          ),
                          _DetailChip(
                            icon: Icons.schedule,
                            label:
                                'Prazo ${formatMeses(cooperativa.prazoMinimoMeses)}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    _HighlightCard(
                      label: 'Economia liquida/mês',
                      value: formatCurrency(economiaLiquida),
                    ),
                    const SizedBox(width: 12),
                    _HighlightCard(
                      label: 'Economia liquida/ano',
                      value: formatCurrency(economiaAnual),
                      highlight: true,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Economia detalhada',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        _DetailRow(
                          icon: Icons.trending_up,
                          label: 'Economia bruta',
                          value: formatCurrency(economiaBruta),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.receipt,
                          label: 'Taxa administrativa',
                          value: formatCurrency(
                            taxaAdministrativa,
                            decimals: 2,
                          ),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.savings,
                          label: 'Economia liquida',
                          value: formatCurrency(economiaLiquida),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detalhes da cooperativa',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        _DetailRow(
                          icon: Icons.account_balance,
                          label: 'Faixa de consumo',
                          value: formatRange(
                            cooperativa.valorMinimoMensal,
                            cooperativa.valorMaximoMensal,
                          ),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.discount,
                          label: 'Desconto aplicado',
                          value: formatPercent(cooperativa.desconto),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.schedule,
                          label: 'Prazo minimo',
                          value: formatMeses(cooperativa.prazoMinimoMeses),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.timer_off,
                          label: 'Carencia',
                          value: formatMeses(cooperativa.carenciaMeses),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.receipt_long,
                          label: 'Taxa administrativa',
                          value: formatPercent(
                            cooperativa.taxaAdministrativa,
                            decimals: 1,
                          ),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.group,
                          label: 'Tipo de cliente',
                          value: cooperativa.tiposCliente
                              .map((tipo) => tipo.label)
                              .join(' / '),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.public,
                          label: 'Regioes atendidas',
                          value: cooperativa.regioes.join(', '),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.receipt_long,
                          label: 'Conta informada',
                          value: formatCurrency(valorConta),
                        ),
                        const Divider(),
                        _DetailRow(
                          icon: Icons.info,
                          label: 'Descricao',
                          value: cooperativa.descricao,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                _SimulacaoMensal(economiaMensal: economiaLiquida),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Voltar para as ofertas'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const _HighlightCard({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: highlight
              ? AppColors.secondary.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.outline),
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
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: highlight ? AppColors.primary : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 18, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _SimulacaoMensal extends StatelessWidget {
  final double economiaMensal;

  const _SimulacaoMensal({required this.economiaMensal});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalAnual = economiaMensal * 12;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Simulacao de 12 meses', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            ...List.generate(12, (index) {
              final mes = index + 1;
              final acumulada = economiaMensal * mes;
              final progresso = totalAnual == 0 ? 0.0 : acumulada / totalAnual;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        'M$mes',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearProgressIndicator(
                            value: progresso,
                            minHeight: 6,
                            backgroundColor: AppColors.surfaceAlt,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Acumulado ${formatCurrency(acumulada)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
