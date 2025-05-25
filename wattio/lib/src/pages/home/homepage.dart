import 'package:flutter/material.dart';
import 'package:wattio/src/pages/medium_spending/monthly_medium_spending.dart';
import 'package:wattio/src/utils/app_theme.dart';
import 'package:wattio/src/utils/custom_text_theme.dart';
import 'package:wattio/src/utils/screen_size.dart';
import 'package:wattio/src/utils/screen_transition.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sunny,
                                color: WattioColors.secondaryContainer,
                                size: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25,
                                ),
                                child: AppText(
                                  text: 'Economize na sua conta de energia',
                                  color: WattioColors.onTertiary,
                                  weight: FontWeight.bold,
                                  size: 30,
                                  maxLines: 2,
                                  align: TextAlign.center,
                                ),
                              ),
                              AppText(
                                text: 'Compare cooperativas da sua região!',
                                color: WattioColors.onTertiary,
                                weight: FontWeight.w500,
                                size: 22,
                                maxLines: 2,
                                align: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: SizedBox(
                                  width: ScreenSize.width(context) / 1.3,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      fadeNavigate(
                                        context,
                                        MonthlyMediumSpending(),
                                      );
                                    },
                                    child: AppText(
                                      text: 'Simular Economia',
                                      color: WattioColors.primary,
                                      weight: FontWeight.bold,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 150,
                            child: Image.asset('assets/icons/bottom_icon.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
