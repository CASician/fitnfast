import 'package:fit_and_fast/screens/homepage_screen.dart';
import 'package:fit_and_fast/screens/order_screens/suggested.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../widgets/back_arrow_top_lx.dart';
import '../../widgets/phone_screen.dart';
import '../MyEmptyPage.dart';

class DoneVsPrepare extends StatelessWidget {
  const DoneVsPrepare({super.key});

  @override
  Widget build(BuildContext context) {
    // Leggiamo i colori dal dotenv
    Color boxBorderColor = Color(
      int.parse(dotenv.env['WHITE'] ?? '0xFF000000'),
    );
    Color boxBackgroundColor = Color(
      int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFFFFFFFF'),
    );
    Color textColor = Color(
      int.parse(dotenv.env['WHITE'] ?? '0xFFFFFFFF'),
    );

    // Dimensioni personalizzabili dei blocchi
    double blockWidth = MediaQuery.of(context).size.width * 0.8;
    double createBlockHeight = MediaQuery.of(context).size.height * 0.35;
    double suggestBlockHeight = MediaQuery.of(context).size.height * 0.2;

    return PhoneScreen(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('../../../assets/logo.png', height: 70),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackArrow(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Blocco "Crea"
            GestureDetector(
              onTap: () {
                // Naviga alla prima pagina
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmptyPage()),
                );
              },
              child: Container(
                width: blockWidth,
                height: createBlockHeight,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: boxBackgroundColor,
                  border: Border.all(color: boxBorderColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      size: 60,
                      color: textColor,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Crea',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Blocco "Suggeriti"
            GestureDetector(
              onTap: () {
                // Naviga alla seconda pagina
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Suggested()),
                );
              },
              child: Container(
                width: blockWidth,
                height: suggestBlockHeight,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: boxBackgroundColor,
                  border: Border.all(color: boxBorderColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rice_bowl_rounded,
                      size: 40,
                      color: textColor,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Suggeriti',
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
