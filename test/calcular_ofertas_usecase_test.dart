import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_front_end_wattio/core/models/cooperativa.dart';
import 'package:desafio_front_end_wattio/data/cooperativa_repository.dart';
import 'package:desafio_front_end_wattio/domain/usecases/calcular_ofertas_usecase.dart';

void main() {
  late CalcularOfertasUseCase useCase;

  setUp(() {
    useCase = CalcularOfertasUseCase(CooperativaRepository());
  });

  test('filtra por tipo, regiao e prazo', () {
    final ofertas = useCase.execute(
      valorConta: 5000,
      tipoCliente: TipoCliente.pessoaFisica,
      ordenacao: OrdenacaoOferta.nome,
      regiao: 'Nordeste',
      prazoMaximo: 12,
    );

    expect(ofertas.length, 1);
    expect(ofertas.first.nome, 'SolAmiga');
  });

  test('ordena por maior economia liquida', () {
    final ofertas = useCase.execute(
      valorConta: 20000,
      tipoCliente: TipoCliente.pessoaJuridica,
      ordenacao: OrdenacaoOferta.maiorEconomia,
      regiao: 'Sudeste',
    );

    expect(ofertas.isNotEmpty, true);
    expect(ofertas.first.nome, 'EnerLimpa');
  });
}
