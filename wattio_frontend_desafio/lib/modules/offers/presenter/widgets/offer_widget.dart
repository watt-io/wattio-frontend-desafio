import 'package:flutter/material.dart';
import 'package:wattio_frontend_desafio/modules/offers/domain/entity/cooperative_entity.dart';
import 'package:wattio_frontend_desafio/shared/extensions/double_extension.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget(
    this.entity, {
    super.key,
    required this.onTap,
  });

  final CooperativeEntity entity;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          onTap: onTap,
          title: Text(
            'Cooperativa: ${entity.name}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          subtitle: Text(
            'Desconto: ${entity.discount.formatAsPercentage()}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          tileColor: Colors.white.withOpacity(0.2),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
