import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../util/theme/imgs_app.dart';
import '../../util/theme/colors_app.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final bool _buttonPagePop;

  const AppBarCustom({bool? buttonPagePop, super.key})
      : _buttonPagePop = buttonPagePop ?? false;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget._buttonPagePop
          ? GestureDetector(
              onTap: () => Modular.to.pop(),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: const Icon(Icons.arrow_back_ios),
              ),
            )
          : null,
      iconTheme: const IconThemeData(size: 42, color: ColorsApp.white),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image(
            image: AssetImage(ImgsApp.logo),
            width: 50,
          ),
        )
      ],
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  0.45, // valor máximo para a largura
            ),
            child: const Text(
              'offKevyn',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 5)),
          PhosphorIcon(
            PhosphorIcons.regular.user,
            color: ColorsApp.white,
            size: 32.0,
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: ColorsApp.primary,
    );
  }
}
