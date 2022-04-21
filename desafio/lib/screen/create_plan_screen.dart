// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio/class/discount_input_formatter.dart';
import 'package:desafio/class/page_size.dart';
import 'package:desafio/class/price_input_formatter.dart';
import 'package:desafio/enum/gradients.dart';
import 'package:desafio/enum/person.dart';
import 'package:desafio/mobx/create_plan_store.dart';
import 'package:desafio/widget/button.dart';
import 'package:desafio/widget/primary/app_bar.dart';
import 'package:desafio/widget/primary/application.dart';
import 'package:desafio/widget/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreatePlanScreen extends StatefulWidget {
  static String nameRoute = '/Plano';
  static Map<String, Widget Function(BuildContext)> route = {
    nameRoute: (context) => const CreatePlanScreen(),
  };

  const CreatePlanScreen({Key? key}) : super(key: key);

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  late PageSize pageSize;
  final store = CreatePlanMobx();

  @override
  void initState() {
    pageSize = PageSize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Application(
        appBar: AppBarCustom(context),
        pageSize: pageSize,
        paddingHorizontal: 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 13),
          const Center(
            child: AutoSizeText(
              'Crie um plano',
              minFontSize: 20,
              maxLines: 3,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, height: 1.2),
            ),
          ),
          const SizedBox(height: 22),
          const Text('Empresa:'),
          const SizedBox(height: 10),
          Center(
            child: TextFieldCustom(
              initialValue: store.name,
              onChanged: (v) => store.name,
              textInputType: TextInputType.name,
              width: pageSize.pWidth * 75,
            ),
          ),
          const SizedBox(height: 22),
          const Text('Tipo de pessoa:'),
          const SizedBox(height: 10),
          RadioListTile<Person>(
            value: Person.physical,
            groupValue: store.person,
            onChanged: (value) => store.person = value!,
            title: const Text('Pessoa Física'),
          ),
          RadioListTile<Person>(
            value: Person.legal,
            groupValue: store.person,
            onChanged: (value) => store.person = value!,
            title: const Text('Pessoa Jurídica'),
          ),
          const SizedBox(height: 22),
          const Text('Desconto:'),
          const SizedBox(height: 10),
          Center(
            child: TextFieldCustom(
              initialValue: store.name,
              onChanged: (v) => store.name,
              width: 100,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                DiscountInputFormatter(),
              ],
              textInputType: TextInputType.number,
              suffixText: '%',
            ),
          ),
          const SizedBox(height: 22),
          const Text('Valor mínimo mensal:'),
          const SizedBox(height: 10),
          Center(
            child: TextFieldCustom(
              initialValue: store.name,
              onChanged: (v) => store.name,
              width: 150,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PriceInputFormatter(),
              ],
              textInputType: TextInputType.number,
              prefixText: 'R\$',
            ),
          ),
          const SizedBox(height: 22),
          const Text('Valor máximo mensal:'),
          const SizedBox(height: 10),
          Center(
            child: TextFieldCustom(
              initialValue: store.name,
              onChanged: (v) => store.name,
              width: 150,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PriceInputFormatter(),
              ],
              textInputType: TextInputType.number,
              prefixText: 'R\$',
            ),
          ),
          const SizedBox(height: 35),
          Center(
            child: Button(
              text: 'Criar',
              gradients: Gradients.green,
              height: 50,
              width: 250,
              onTap: () {},
            ),
          ),
          const SizedBox(height: 22),
        ],
      );
    });
  }
}
