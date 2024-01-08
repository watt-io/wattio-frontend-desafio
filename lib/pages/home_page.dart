import 'package:flutter/material.dart';
import 'package:simulador/models/coop_model.dart';
import 'package:simulador/services/calculo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CoopModel> cooperativas = [
    CoopModel(
        nome: 'EnerFacil',
        valorMinimoMensal: 1000,
        valorMaximoMensal: 40000,
        desconto: .2),
    CoopModel(
        nome: 'EnerLimpa',
        valorMinimoMensal: 10000,
        valorMaximoMensal: 80000,
        desconto: .25),
    CoopModel(
        nome: 'EnerGrande',
        valorMinimoMensal: 40000,
        valorMaximoMensal: 100000,
        desconto: .3),
    CoopModel(
        nome: 'Energisa',
        valorMinimoMensal: 60000,
        valorMaximoMensal: 120000,
        desconto: .35),
  ];

  CoopModel? ofertaEscolhida;
  double economiaAnual = 0.0;
  double economiaMensal = 0.0;
  double valorConta = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas de Energia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Entre com o valor médio da conta de energia em R\$'),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(8)),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  valorConta = double.tryParse(value) ?? 0.0;
                  ofertaEscolhida = null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (valorConta <= 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Erro'),
                        content: const Text(
                            'Por favor, insira um valor válido maior que zero.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                // Filtra as cooperativas com base no valor informado pelo usuário
                List<CoopModel> cooperativasDisponiveis = cooperativas
                    .where((cooperativa) =>
                        valorConta >= cooperativa.valorMinimoMensal)
                    .toList();

                // Exibe as ofertas disponíveis após o usuário inserir o valor médio da conta
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      
                      
                      backgroundColor: Colors.white,
                      title: const Text('Ofertas Disponíveis'),
                      content: Column(
                        children: cooperativasDisponiveis.map((cooperativa) {
                          return ListTile(
                            title: Text(cooperativa.nome),
                            subtitle: Text(
                                'Desconto: ${cooperativa.desconto * 100}%'),
                            onTap: () {
                              setState(() {
                                ofertaEscolhida = cooperativa;
                              });
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
              child: const Text('Ver Ofertas'),
            ),
            const SizedBox(height: 16.0),
            if (ofertaEscolhida != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cooperativa Escolhida: ${ofertaEscolhida!.nome}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Calcula e exibe a economia após o usuário escolher uma cooperativa
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          economiaAnual = Calculo().calcularEconomiaAnual(
                              ofertaEscolhida!, valorConta);
                          economiaMensal = Calculo().calcularEconomiaMensal(
                              ofertaEscolhida!, valorConta);
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text('Economia Estimada'),
                            content: Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: const Text('Economia Mensal'),
                                    subtitle: Text('R\$$economiaMensal'),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    title: const Text('Economia Anual'),
                                    subtitle: Text('R\$$economiaAnual'),
                                  ),
                                ),
                                const SizedBox(height: 56.0),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Contratação'),
                                          content: Text(
                                              'Parabéns! Você contratou a cooperativa ${ofertaEscolhida!.nome}.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('Quero Contratar'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Calcular Economia'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
