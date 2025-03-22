import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/phone_screen.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneScreen(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset('../../../assets/logo.png', height: 70),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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