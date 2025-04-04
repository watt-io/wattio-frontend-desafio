import 'package:flutter/material.dart';

import '../theme_colors.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const AppBarDefault({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      centerTitle: true,
      backgroundColor: ThemeColor.backgroundWhite,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
