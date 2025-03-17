import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fit_and_fast/screens/homepage_screen.dart';
import 'package:fit_and_fast/screens/menus/menu_screen.dart';
import 'package:fit_and_fast/screens/deals_screen.dart';
import 'package:fit_and_fast/screens/settings_screen.dart';

import '../screens/order_screens/1st_order_done_vs_prepare.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomNavbar({
    required this.currentIndex,
    super.key,
  });

  void _onItemTapped(BuildContext context, int index) {
    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = HomePage();
        break;
      case 1:
        nextScreen = MenuScreen();
        break;
      case 2:
        nextScreen = DealsScreen();
        break;
      case 3:
        nextScreen = SettingsScreen();
        break;
      default:
        nextScreen = HomePage();
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dimensioni della navbar e del bottone plus
    double navBarHeight = 60;
    double plusButtonDiameter = 70;
    // Colori personalizzati dal dotenv
    Color backgroundColor = Color(int.parse(dotenv.env['BACKGROUND_COLOR'] ?? '0xFF4CAF50'));
    Color selectedColor = Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFFFFA500'));
    Color unselectedColor = Colors.white;

    return SizedBox(
      height: navBarHeight + plusButtonDiameter / 2 , // spazio per il plus che sporge
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Barra di navigazione con divisione in tre parti
          Positioned(
            top: plusButtonDiameter / 2,
            left: 0,
            right: 0,
            child: Container(
              height: navBarHeight,
              color: backgroundColor,
              child: Row(
                children: [
                  // Parte sinistra: due item
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavBarItem(context, 0, Icons.home, 'Home', currentIndex, selectedColor, unselectedColor),
                        _buildNavBarItem(context, 1, Icons.restaurant_menu, 'Menu', currentIndex, selectedColor, unselectedColor),
                      ],
                    ),
                  ),
                  // Spazio centrale per il bottone plus
                  SizedBox(width: plusButtonDiameter),
                  // Parte destra: due item
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavBarItem(context, 2, Icons.local_offer, 'Offerte', currentIndex, selectedColor, unselectedColor),
                        _buildNavBarItem(context, 3, Icons.settings, 'Impostazioni', currentIndex, selectedColor, unselectedColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottone centrale "plus"
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () {
                // Apre la pagina del menu
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DoneVsPrepare()),
                );
              },
              child: Container(
                width: plusButtonDiameter,
                height: plusButtonDiameter,
                decoration: BoxDecoration(
                  color: selectedColor,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(BuildContext context, int index, IconData icon, String label, int currentIndex, Color selectedColor, Color unselectedColor) {
    bool isSelected = index == currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(context, index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          // L'intera area della cella è cliccabile
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isSelected ? selectedColor : unselectedColor),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(color: isSelected ? selectedColor : unselectedColor, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
