import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OfferListItemWidget extends StatelessWidget {
  const OfferListItemWidget({
    Key? key, 
    required this.title, 
    required this.subtitle, 
    this.onTap
  }) : super(key: key);
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    leading: SizedBox(
      width: 50.0,
      height: 50.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: Image.asset(
          Assets.handLight,
          fit: BoxFit.cover,
        ),
      ),
    ),
    trailing: Icon(
      Icons.keyboard_arrow_right,
      color: Theme.of(context).colorScheme.onBackground.withAlpha(200),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyText1,
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}