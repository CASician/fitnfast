import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/ordina_button.dart';
import '../widgets/phone_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            //BackgroundDecoration(),
            Column(
              children: [
                Spacer(),
                // MyCarouselSlider(),
                Image.asset('../assets/logo.png'),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Ordina_button(),         // Main Button
                  ),
                ),
                SizedBox(height: 20),
                Spacer(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomNavbar(currentIndex: 0),
      ),
    );
  }
}