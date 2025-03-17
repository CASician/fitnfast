import 'package:fit_and_fast/widgets/phone_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneScreen(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('../../../assets/logo.png', height: 70),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: null, // FIXME the back arrow sometimes appears, sometimes disappears. I don't know why.
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // BackArrow(),
            Center(
              child: Text('Settings Screen', style: TextStyle(fontSize: 24, color: Color(0xFFFF9900))),
            ),
          ]
        ),
        bottomNavigationBar: CustomNavbar(currentIndex: 3),
      ),
    );
  }

}