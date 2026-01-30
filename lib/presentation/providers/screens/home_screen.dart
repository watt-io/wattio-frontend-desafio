import 'package:desafio_front_end_wattio/core/models/cooperativa.dart';
import 'package:desafio_front_end_wattio/presentation/providers/cooperativa_provider.dart';
import 'package:desafio_front_end_wattio/presentation/theme/app_theme.dart';
import 'package:desafio_front_end_wattio/presentation/utils/currency_input_formatter.dart';
import 'package:desafio_front_end_wattio/presentation/utils/formatters.dart';
import 'package:desafio_front_end_wattio/presentation/widgets/cooperativa_card.dart';
import 'package:desafio_front_end_wattio/presentation/widgets/decorated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'oferta_detalhe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controlador do campo de entrada de valor da conta de energia.
  final _controller = TextEditingController();
  bool _animateIn = false;

  // Inicia a animação ao montar o widge, esperando 80ms.
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 80), () {
      if (!mounted) return;
      setState(() => _animateIn = true);
    });
  }

  // Limpa o controller ao desmontar o widget.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Metodos para interagir com o provider.
  void _buscarOfertas(CooperativaProvider provider) {
    final valor = _parseValor(_controller.text);
    if (valor == null || valor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe um valor válido para a conta de energia.'),
        ),
      );
      return;
    }
    FocusScope.of(context).unfocus();
    provider.calcularOfertas(valor);
  }

  double? _parseValor(String text) {
    final sanitized = text.replaceAll('.', '').replaceAll(',', '.').trim();
    return double.tryParse(sanitized);
  }

  void _abrirComparacao(List<Cooperativa> selecionadas, double valorConta) {
    if (selecionadas.length < 2) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      // Bottom sheet com tabela comparativa das ofertas selecionadas.
      builder: (_) =>
          _ComparisonSheet(cooperativas: selecionadas, valorConta: valorConta),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CooperativaProvider>(context);
    final offers = provider.ofertas;
    final valorConta = provider.valorConta;
    final regioes = provider.regioesDisponiveis;
    final selectedCount = provider.comparacaoSelecionadas.length;
    final selecionadas = provider.ofertasSelecionadas;
    final prazoMaximo = provider.prazoMaximo;
    double? melhorEconomia;
    String? melhorId;
    // Encontra a melhor economia liquida para destacar o card.
    if (offers.isNotEmpty && valorConta > 0) {
      for (final coop in offers) {
        final economia = coop.calcularEconomiaLiquida(valorConta);
        if (melhorEconomia == null || economia > melhorEconomia) {
          melhorEconomia = economia;
          melhorId = coop.id;
        }
      }
    }
    final economiaEstimada = melhorEconomia;

    return Scaffold(
      body: DecoratedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AnimatedSection(
                  animate: _animateIn,
                  child: _HeroHeader(offersCount: offers.length),
                ),
                const SizedBox(height: 18),
                _AnimatedSection(
                  animate: _animateIn,
                  delay: const Duration(milliseconds: 120),
                  child: _InputCard(
                    controller: _controller,
                    onSearch: () => _buscarOfertas(provider),
                  ),
                ),
                const SizedBox(height: 16),
                _AnimatedSection(
                  animate: _animateIn,
                  child: _FilterCard(
                    tipoCliente: provider.tipoCliente,
                    regiaoSelecionada: provider.regiaoSelecionada,
                    ordenacao: provider.ordenacao,
                    prazoMaximo: prazoMaximo,
                    regioes: regioes,
                    onTipoClienteChanged: provider.atualizarTipoCliente,
                    onRegiaoChanged: provider.atualizarRegiao,
                    onOrdenacaoChanged: provider.atualizarOrdenacao,
                    onPrazoChanged: provider.atualizarPrazoMaximo,
                  ),
                ),
                const SizedBox(height: 16),
                _AnimatedSection(
                  animate: _animateIn,
                  delay: const Duration(milliseconds: 220),
                  child: _SummaryCard(
                    valorConta: valorConta,
                    economiaEstimada: economiaEstimada,
                    hasOffers: offers.isNotEmpty,
                  ),
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Text(
                      'Ofertas disponíveis',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 10),
                    Chip(label: Text('${offers.length}')),
                  ],
                ),
                const SizedBox(height: 12),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: offers.isEmpty
                      ? _EmptyState(hasSearch: valorConta > 0)
                      : ListView.separated(
                          key: ValueKey(offers.length),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: offers.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (_, index) {
                            final coop = offers[index];
                            return CooperativaCard(
                              index: index,
                              cooperativa: coop,
                              valorConta: valorConta,
                              isSelected: provider.comparacaoSelecionadas
                                  .contains(coop.id),
                              destaque: coop.id == melhorId,
                              onSelect: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        OfertaDetalheScreen(coop, valorConta),
                                  ),
                                );
                              },
                              onToggleCompare: () =>
                                  provider.alternarComparacao(coop),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _CompareBar(
        selectedCount: selectedCount,
        onCompare: () => _abrirComparacao(selecionadas, valorConta),
        onClear: provider.limparComparacao,
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  final int offersCount;

  const _HeroHeader({required this.offersCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Marketplace de Energia',
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Simule sua economia e escolha a cooperativa ideal para sua região.',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _HeroTag(icon: Icons.solar_power, label: 'Energia limpa'),
              _HeroTag(icon: Icons.savings, label: 'Economia mensal'),
              _HeroTag(icon: Icons.hub, label: '$offersCount cooperativas'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeroTag({required this.icon, required this.label});

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

class _InputCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const _InputCard({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sua conta média mensal', style: theme.textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              'Informe o valor em reais e veja as ofertas disponíveis.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              textInputAction: TextInputAction.search,
              inputFormatters: [CurrencyInputFormatter()],
              autofillHints: const [AutofillHints.transactionAmount],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.flash_on),
                prefixText: 'R\$ ',
                hintText: '3.500',
                labelText: 'Valor da conta',
              ),
              onSubmitted: (_) => onSearch(),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onSearch,
                icon: const Icon(Icons.search),
                label: const Text('Buscar ofertas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final double valorConta;
  final double? economiaEstimada;
  final bool hasOffers;

  const _SummaryCard({
    required this.valorConta,
    required this.economiaEstimada,
    required this.hasOffers,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final economiaAnual = economiaEstimada == null
        ? null
        : economiaEstimada! * 12;
    if (valorConta <= 0) {
      return _InfoBanner(
        icon: Icons.tips_and_updates,
        title: 'Comece pela sua conta de energia',
        subtitle:
            'Assim que inserir o valor, mostramos as cooperativas ideais.',
      );
    }
    if (!hasOffers) {
      return _InfoBanner(
        icon: Icons.search_off,
        title: 'Nenhuma oferta compatível',
        subtitle: 'Tente um valor diferente para encontrar novas cooperativas.',
      );
    }

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Resumo da simulação', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              _SummaryItem(
                label: 'Conta mensal',
                value: formatCurrency(valorConta),
              ),
              const SizedBox(width: 16),
              _SummaryItem(
                label: 'Economia liquida',
                value: economiaEstimada == null
                    ? '--'
                    : formatCurrency(economiaEstimada!),
                highlight: true,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            economiaAnual == null
                ? 'Baseado no maior desconto disponivel.'
                : 'Economia anual estimada: ${formatCurrency(economiaAnual)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const _SummaryItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: highlight
              ? AppColors.secondary.withOpacity(0.15)
              : AppColors.surfaceAlt,
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

class _FilterCard extends StatelessWidget {
  final TipoCliente tipoCliente;
  final String regiaoSelecionada;
  final OrdenacaoOferta ordenacao;
  final int? prazoMaximo;
  final List<String> regioes;
  final ValueChanged<TipoCliente> onTipoClienteChanged;
  final ValueChanged<String?> onRegiaoChanged;
  final ValueChanged<OrdenacaoOferta> onOrdenacaoChanged;
  final ValueChanged<int?> onPrazoChanged;

  const _FilterCard({
    required this.tipoCliente,
    required this.regiaoSelecionada,
    required this.ordenacao,
    required this.prazoMaximo,
    required this.regioes,
    required this.onTipoClienteChanged,
    required this.onRegiaoChanged,
    required this.onOrdenacaoChanged,
    required this.onPrazoChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filtros e ordenacao', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Semantics(
              label: 'Selecione o tipo de cliente',
              child: SegmentedButton<TipoCliente>(
                segments: const [
                  ButtonSegment(
                    value: TipoCliente.pessoaFisica,
                    label: Text('PF'),
                    icon: Icon(Icons.person),
                  ),
                  ButtonSegment(
                    value: TipoCliente.pessoaJuridica,
                    label: Text('PJ'),
                    icon: Icon(Icons.apartment),
                  ),
                ],
                showSelectedIcon: false,
                selected: {tipoCliente},
                onSelectionChanged: (selection) {
                  onTipoClienteChanged(selection.first);
                },
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: regiaoSelecionada,
              decoration: const InputDecoration(
                labelText: 'Regiao',
                prefixIcon: Icon(Icons.map),
              ),
              items: regioes
                  .map(
                    (regiao) =>
                        DropdownMenuItem(value: regiao, child: Text(regiao)),
                  )
                  .toList(),
              onChanged: onRegiaoChanged,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<OrdenacaoOferta>(
              value: ordenacao,
              decoration: const InputDecoration(
                labelText: 'Ordenar por',
                prefixIcon: Icon(Icons.swap_vert),
              ),
              items: OrdenacaoOferta.values
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                onOrdenacaoChanged(value);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int?>(
              value: prazoMaximo,
              decoration: const InputDecoration(
                labelText: 'Prazo maximo',
                prefixIcon: Icon(Icons.calendar_month),
              ),
              items: const [
                DropdownMenuItem(value: null, child: Text('Qualquer prazo')),
                DropdownMenuItem(value: 12, child: Text('Ate 12 meses')),
                DropdownMenuItem(value: 24, child: Text('Ate 24 meses')),
                DropdownMenuItem(value: 36, child: Text('Ate 36 meses')),
              ],
              onChanged: onPrazoChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _CompareBar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onCompare;
  final VoidCallback onClear;

  const _CompareBar({
    required this.selectedCount,
    required this.onCompare,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final visible = selectedCount >= 2;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: visible ? 76 : 0,
      child: visible
          ? SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: AppColors.outline)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Comparar ofertas',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '$selectedCount selecionadas',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),
                    TextButton(onPressed: onClear, child: const Text('Limpar')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: onCompare,
                      child: const Text('Comparar'),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _ComparisonSheet extends StatelessWidget {
  final List<Cooperativa> cooperativas;
  final double valorConta;

  const _ComparisonSheet({
    required this.cooperativas,
    required this.valorConta,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = [
      _ComparisonMetric(
        label: 'Desconto',
        value: (coop) => formatPercent(coop.desconto),
      ),
      _ComparisonMetric(
        label: 'Economia liquida/mês',
        value: (coop) =>
            formatCurrency(coop.calcularEconomiaLiquida(valorConta)),
      ),
      _ComparisonMetric(
        label: 'Economia liquida/ano',
        value: (coop) =>
            formatCurrency(coop.calcularEconomiaLiquida(valorConta) * 12),
      ),
      _ComparisonMetric(
        label: 'Faixa',
        value: (coop) =>
            formatRange(coop.valorMinimoMensal, coop.valorMaximoMensal),
      ),
      _ComparisonMetric(
        label: 'Prazo minimo',
        value: (coop) => formatMeses(coop.prazoMinimoMeses),
      ),
      _ComparisonMetric(
        label: 'Carencia',
        value: (coop) => formatMeses(coop.carenciaMeses),
      ),
      _ComparisonMetric(
        label: 'Taxa adm',
        value: (coop) => formatPercent(coop.taxaAdministrativa, decimals: 1),
      ),
      _ComparisonMetric(label: 'Modalidade', value: (coop) => coop.modalidade),
      _ComparisonMetric(
        label: 'Regioes',
        value: (coop) => coop.regioes.join(', '),
      ),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.outline,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),
              Text('Comparar ofertas', style: theme.textTheme.titleMedium),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowHeight: 44,
                      dataRowMinHeight: 48,
                      columns: [
                        const DataColumn(label: Text('Item')),
                        ...cooperativas.map(
                          (coop) => DataColumn(
                            label: Text(
                              coop.nome,
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                      rows: metrics
                          .map(
                            (metric) => DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    metric.label,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ),
                                ...cooperativas.map(
                                  (coop) => DataCell(
                                    Text(
                                      metric.value(coop),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ComparisonMetric {
  final String label;
  final String Function(Cooperativa) value;

  const _ComparisonMetric({required this.label, required this.value});
}

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoBanner({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.18),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool hasSearch;

  const _EmptyState({required this.hasSearch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outline),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.energy_savings_leaf,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              hasSearch
                  ? 'Nenhuma cooperativa atende esse valor. Ajuste o valor e tente novamente.'
                  : 'Informe sua conta para descobrir as melhores opções.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSection extends StatefulWidget {
  final bool animate;
  final Widget child;
  final Duration delay;

  const _AnimatedSection({
    required this.animate,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<_AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<_AnimatedSection> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _runAnimation();
  }

  @override
  void didUpdateWidget(covariant _AnimatedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !_visible) {
      _runAnimation();
    }
  }

  void _runAnimation() {
    if (!widget.animate) return;
    Future.delayed(widget.delay, () {
      if (!mounted) return;
      setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.04),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
