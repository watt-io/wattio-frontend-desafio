import 'package:flutter/material.dart';
import 'package:wattio_desafio/pages/widgets/offer_list.dart';
import 'package:wattio_desafio/pages/widgets/selected_offers_details.dart';
import 'package:wattio_desafio/utils/constants.dart';
import 'package:wattio_desafio/utils/currency_formatter.dart';
import 'package:wattio_desafio/utils/validators.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _valorContaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _selectedOfferIndex;
  bool visibleCooperatives = false;

  bool _isOfferVisible(Map<String, Object> oferta) {
    double valorConta = double.parse(
            _valorContaController.text.replaceAll(RegExp(r'[^0-9]'), '')) /
        100.0;
    num valorMinimoMensal = oferta['valorMinimoMensal']! as num;
    num valorMaximoMensal = oferta['valorMaximoMensal']! as num;
    return valorConta >= valorMinimoMensal && valorConta <= valorMaximoMensal;
  }

  double _calcularEconomiaAnual() {
    if (_selectedOfferIndex != null) {
      double valorConta = double.parse(
              _valorContaController.text.replaceAll(RegExp(r'[^0-9]'), '')) /
          100.0;
      double desconto = ofertas[_selectedOfferIndex!]['desconto']! as double;
      return valorConta * 12 * desconto;
    }
    return 0.0;
  }

  double _calcularEconomiaMensal() {
    if (_selectedOfferIndex != null) {
      double valorConta = double.parse(
              _valorContaController.text.replaceAll(RegExp(r'[^0-9]'), '')) /
          100.0;
      double desconto = ofertas[_selectedOfferIndex!]['desconto']! as double;
      return valorConta * desconto;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Marketplace de Energia',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  leading: Icon(Icons.store, size: 50),
                  title: Text(
                    'Calcule a economia da sua empresa',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _valorContaController,
                  inputFormatters: [CurrencyInputFormatter()],
                  decoration: const InputDecoration(
                    labelText: 'Valor médio mensal da conta de energia (R\$)',
                    prefixIcon: Icon(Icons.monetization_on),
                  ),
                  validator: validateValorConta,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      setState(() {
                        visibleCooperatives = true;
                        _selectedOfferIndex = null;
                      });
                    }
                  },
                  child: const Text('Ver Ofertas'),
                ),
                const SizedBox(height: 15),
                if (visibleCooperatives == true)
                  OfferList(
                    isOfferVisible: _isOfferVisible,
                    selectedOfferIndex: _selectedOfferIndex,
                    onOfferTap: (int index) {
                      setState(() {
                        _selectedOfferIndex = index;
                      });
                    },
                  ),
                const SizedBox(height: 15),
                if (_selectedOfferIndex != null)
                  SelectedOfferDetails(
                    validate: _formKey.currentState?.validate() == true,
                    selectedOfferIndex: _selectedOfferIndex,
                    calcularEconomiaAnual: _calcularEconomiaAnual,
                    calcularEconomiaMensal: _calcularEconomiaMensal,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
