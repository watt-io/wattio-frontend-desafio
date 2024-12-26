import 'package:energy_marketplace/pages/company_info_page.dart';
import 'package:energy_marketplace/pages/models/company_model.dart';
import 'package:flutter/material.dart';

class CompanyCard extends StatefulWidget {
  const CompanyCard({
    required this.currentModel,
    required this.displayedModels,
    required this.onPressed,
    super.key,
  });

  final CompanyModel currentModel;
  final Set<CompanyModel> displayedModels;
  final VoidCallback onPressed;

  @override
  State<CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    final Color isSelected =
        widget.currentModel.isSelected ? Colors.white : Colors.black;

    return Card(
      color: widget.currentModel.isSelected ? Colors.green : null,
      child: ListTile(
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const CompanyInfoPage();
                },
                settings: RouteSettings(
                  arguments: {
                    'currentModel': widget.currentModel,
                  },
                ),
              ),
            );
          },
          child: Icon(
            Icons.info_outlined,
            color: isSelected,
          ),
        ),
        title: Text(
          widget.currentModel.nome,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isSelected,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Desconto: ${(widget.currentModel.desconto * 100).toInt()} %',
          style: TextStyle(
            color: isSelected,
          ),
        ),
        onTap: widget.onPressed,
      ),
    );
  }
}
