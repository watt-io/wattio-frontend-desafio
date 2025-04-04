import 'package:flutter/material.dart';

class OfferListItemWidget extends StatelessWidget {
  const OfferListItemWidget({
    Key? key, 
    required this.title, 
    required this.subtitle, 
    this.onTap, 
    this.leading
  }) : super(key: key);
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    leading: leading,
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