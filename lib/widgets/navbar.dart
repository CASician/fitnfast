import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../screens/homepage_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/niente_cibo_screen.dart';


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
        nextScreen = NienteCiboScreen();
        break;
      case 3:
        nextScreen = NienteCiboScreen();
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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(int.parse(dotenv.env['BACKGROUND_COLOR'] ?? '0xFF4CAF50')),
      selectedItemColor: Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFF4CAF50')),
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Offerte',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Impostazioni',
        ),
      ],
    );
  }
}
