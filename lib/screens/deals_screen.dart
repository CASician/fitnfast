import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/phone_screen.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // BackArrow(),
            Center(
              child: Text('No Offers yet', style: TextStyle(fontSize: 24, color: Color(0xFFFF9900))),
            ),
          ]
        ),
        bottomNavigationBar: CustomNavbar(currentIndex: 2),
      )
    );
  }

}