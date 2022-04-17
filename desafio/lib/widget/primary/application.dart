import 'package:flutter/material.dart';

import 'package:desafio/class/page_size.dart';
import 'package:desafio/widget/primary/app_bar.dart';

class Application extends StatefulWidget {
  final List<Widget> children;
  final PageSize pageSize;
  final CrossAxisAlignment crossAxisAlignment;
  final AppBarCustom appBar;
  final double paddingHorizontal;

  const Application({
    Key? key,
    required this.children,
    required this.pageSize,
    required this.appBar,
    this.paddingHorizontal = 10,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.pageSize.isWeb ? null : widget.appBar,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'asset/fundo.jpg',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: Colors.white,
            width: widget.pageSize.isWeb ? widget.pageSize.widthDefault : MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                // constraints: BoxConstraints(minHeight: widget.pageSize.height - (widget.appBar.toolbarHeight ?? 0.0)),
                constraints: BoxConstraints(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
                  color: Colors.white,
                  width: widget.pageSize.isWeb ? widget.pageSize.widthDefault : double.infinity,
                  child: Column(
                    crossAxisAlignment: widget.crossAxisAlignment,
                    children: [
                      if (widget.pageSize.isWeb) widget.appBar.webAppBar(),
                      ...widget.children,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
