import 'package:flutter/material.dart';
import 'package:wattio_test/data/repositories/desconto_repository.dart';
import 'package:wattio_test/presentation/widgets/dialog_helper.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  TextEditingController gastoMensalController = TextEditingController();
  String selectedType = 'PF';
  List<Map<String, dynamic>> ofertaData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Ofertas'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Calcule a economia da sua energia',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'O valor médio mensal da sua conta de energia é:',
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              const Text(
                'R\$',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: gastoMensalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Insira o valor',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Selecione o tipo de cliente:',
            style: TextStyle(fontSize: 18),
          ),
          DropdownButton<String>(
            value: selectedType,
            onChanged: (String? newValue) {
              setState(() {
                selectedType = newValue!;
              });
            },
            items: ['Pessoa Física', 'Pessoa Jurídica']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value == 'Pessoa Física' ? 'PF' : 'PJ',
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _handleCalculateButton();
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Calcular Ofertas"),
              const SizedBox(
                width: 20,
              ),
              Image.asset("assets/images/desconto.png", height: 24, width: 24)
            ]),
          ),
          if (ofertaData.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Ofertas Disponíveis:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ofertaData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _showSavingsDialog(ofertaData[index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${ofertaData[index]['nome']}'),
                            Text(
                              'Desconto: ${_formatarDesconto(ofertaData[index]['desconto'])}',
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          if (ofertaData.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Sem ofertas disponíveis',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showSavingsDialog(Map<String, dynamic> oferta) {
    DialogHelper.showSavingsDialog(context, oferta, gastoMensalController);
  }

  void _handleCalculateButton() async {
    if (gastoMensalController.text.isEmpty || selectedType.isEmpty) {
      DialogHelper.showAlertDialog(
          context, 'Aviso', 'Preencha todos os campos para calcular.');
    } else {
      double valorMensal = double.parse(gastoMensalController.text);

      try {
        List<Map<String, dynamic>> data =
            await DescontoRepository().fetchDescontos(selectedType);

        List<Map<String, dynamic>> filteredData = data
            .where((oferta) =>
                oferta['valorMinimoMensal'] <= valorMensal &&
                oferta['valorMaximoMensal'] >= valorMensal)
            .toList();

        setState(() {
          ofertaData = List<Map<String, dynamic>>.from(filteredData);
        });
      } catch (error) {
        DialogHelper.showAlertDialog(
            context, 'Erro', 'Erro ao carregar dados da oferta: $error');
      }
    }
  }

  String _formatarDesconto(int desconto) {
    return '$desconto%';
  }
}
