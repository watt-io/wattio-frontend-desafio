import 'package:flutter/material.dart';
import 'package:wattio_test/presentation/screens/calculete_screen.dart';
import 'package:wattio_test/presentation/screens/companies_screen.dart';
import 'package:wattio_test/presentation/screens/initial_screen.dart';
import 'package:wattio_test/presentation/screens/who_we_are_screen.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            this._selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/icon_energia.png', height: 24, width: 24),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/calculadora.png', height: 24, width: 24),
            label: "Calcular",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/companhia.png', height: 24, width: 24),
            label: "Empresas",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/livro.png', height: 24, width: 24),
            label: "Quem somos",
          ),
        ],
      ),
      body: Stack(
        children: [
          renderView(0, const InitialScreen()),
          renderView(1, const CalculateScreen()),
          renderView(2, const CompaniesScreen()),
          renderView(3, const WhoWeAreScreen()),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
