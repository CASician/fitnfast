import 'package:fit_and_fast/widgets/back_arrow_top_lx.dart';
import 'package:fit_and_fast/widgets/background_decoration_container.dart';
import 'package:fit_and_fast/widgets/ordina_button.dart';
import 'package:flutter/material.dart';
import 'package:fit_and_fast/widgets/phone_screen.dart';

import 'menu_screen.dart';


class NienteCiboScreen extends StatelessWidget {
  const NienteCiboScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            BackgroundDecoration(),
            BackArrow(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen()),
              ),
            ),
            Center(
              child: Ordina_button(),
            ),
          ],
        ),
      ),
    );
  }
}
