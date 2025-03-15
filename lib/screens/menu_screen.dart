import 'package:fit_and_fast/screens/niente_cibo_screen.dart';
import 'package:fit_and_fast/widgets/back_arrow_top_lx.dart';
import 'package:fit_and_fast/widgets/background_decoration_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/navbar.dart';
import '../widgets/phone_screen.dart';
import 'homepage_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhoneScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            //BackgroundDecoration(),
            BackArrow(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildGridButton(context, 'PROTEINE'),
                      _buildGridButton(context, 'CARBS'),
                      _buildGridButton(context, 'VERDURE'),
                      _buildGridButton(context, 'FRUTTA'),
                      _buildGridButton(context, 'DOLCI'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomButton(context, 'Piatti Pronti'),
                  _buildBottomButton(context, 'Bevande'),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavbar(currentIndex: 1),
      ),
    );
  }
}

Widget _buildGridButton(BuildContext context, String label) {
  return SizedBox(
    width: 150,
    height: 150,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF4CAF50')),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NienteCiboScreen())),
      child: Text(
          label,
          style: TextStyle(
              color: Color(int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFF000000')),
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildBottomButton(BuildContext context, String label) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFFFFA500')),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NienteCiboScreen())),
    child: Text(
        label,
        style: TextStyle(
            color: Color(int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFF000000')),
            fontSize: 16,
            fontWeight: FontWeight.bold)),
  );
}
