import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wattio_front/energy_cooperative/energy_cooperative_entity.dart';

class EnergyCooperativeCard extends StatelessWidget {
  final String name;
  final double discount;
  final int economy;
  final PersonType personType;

  final NumberFormat _realFormatter = NumberFormat('#,###,000', 'pt_BR');

  EnergyCooperativeCard({
    required this.name,
    required this.discount,
    required this.economy,
    required this.personType,
    Key? key,
  }) : super(key: key);

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cooperativa $name'),
          content: Text(
            'Contratar a cooperativa de energia $name.',
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Contratar',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Continuar Simulação',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var leadingIcon =
        personType == PersonType.nonHuman ? Icons.store : Icons.home_work;

    return Card(
      elevation: 0.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: ListTile(
                  leading: Icon(
                    leadingIcon,
                    size: 46,
                  ),
                  title:
                      Text(name, style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(
                    'Proporciona ${discount * 100}% de desconto',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () => _showAlertDialog(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                      color: Colors.red.shade400.withAlpha((0.2 * 255).toInt()),
                    ),
                    minimumSize: const Size(120, 50),
                  ),
                  child: Text(
                    'Contrate!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
          const Divider(indent: 12, endIndent: 12, height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 12,
              ),
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Text(
              'Você economiza até R\$${_realFormatter.format(economy * 12)} por ano!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Economia de R\$${_realFormatter.format(economy)} por mês',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
