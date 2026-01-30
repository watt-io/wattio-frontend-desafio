import 'package:flutter/material.dart';
import '../../core/models/cooperativa.dart';
import '../../data/cooperativa_repository.dart';
import '../../domain/usecases/calcular_ofertas_usecase.dart';

// Classe que representa o provedor de cooperativas.
class CooperativaProvider extends ChangeNotifier {
  // Instancia do repositório de cooperativas.
  final _repository = CooperativaRepository();
  // Instancia do use case de calcular ofertas.
  late final CalcularOfertasUseCase _useCase = CalcularOfertasUseCase(
    _repository,
  );
  // Variaveis de estado, representando os filtros e ordenacao.
  List<Cooperativa> _ofertas = [];
  double _valorConta = 0;
  TipoCliente _tipoCliente = TipoCliente.pessoaFisica;
  String _regiaoSelecionada = 'Todas';
  OrdenacaoOferta _ordenacao = OrdenacaoOferta.maiorEconomia;
  int? _prazoMaximo;
  final Set<String> _selecionadas = {};

  List<Cooperativa> get ofertas => _ofertas;
  double get valorConta => _valorConta;
  TipoCliente get tipoCliente => _tipoCliente;
  String get regiaoSelecionada => _regiaoSelecionada;
  OrdenacaoOferta get ordenacao => _ordenacao;
  int? get prazoMaximo => _prazoMaximo;
  List<String> get regioesDisponiveis => _repository.regioesDisponiveis();
  Set<String> get comparacaoSelecionadas => _selecionadas;

  List<Cooperativa> get ofertasSelecionadas =>
      _ofertas.where((coop) => _selecionadas.contains(coop.id)).toList();

  // Metodo para calcular as ofertas com base nos filtros e ordenacao.
  void calcularOfertas(double valor) {
    _valorConta = valor;
    // Mantem o estado centralizado para filtros e ordenacao.
    _ofertas = _useCase.execute(
      valorConta: valor,
      tipoCliente: _tipoCliente,
      ordenacao: _ordenacao,
      regiao: _regiaoSelecionada,
      prazoMaximo: _prazoMaximo,
    );
    _sincronizarSelecao();
    notifyListeners();
  }

  void atualizarTipoCliente(TipoCliente tipo) {
    _tipoCliente = tipo;
    _recalcularSePossivel();
  }

  void atualizarRegiao(String? regiao) {
    if (regiao == null || regiao.isEmpty) return;
    _regiaoSelecionada = regiao;
    _recalcularSePossivel();
  }

  void atualizarOrdenacao(OrdenacaoOferta ordenacao) {
    _ordenacao = ordenacao;
    _recalcularSePossivel();
  }

  void atualizarPrazoMaximo(int? prazoMaximo) {
    _prazoMaximo = prazoMaximo;
    _recalcularSePossivel();
  }

  void alternarComparacao(Cooperativa cooperativa) {
    if (_selecionadas.contains(cooperativa.id)) {
      _selecionadas.remove(cooperativa.id);
    } else {
      _selecionadas.add(cooperativa.id);
    }
    notifyListeners();
  }

  void limparComparacao() {
    _selecionadas.clear();
    notifyListeners();
  }

  void _recalcularSePossivel() {
    if (_valorConta > 0) {
      calcularOfertas(_valorConta);
    } else {
      notifyListeners();
    }
  }

  void _sincronizarSelecao() {
    // Remove selecoes antigas quando as ofertas mudam.
    final idsValidos = _ofertas.map((coop) => coop.id).toSet();
    _selecionadas.removeWhere((id) => !idsValidos.contains(id));
  }
}
