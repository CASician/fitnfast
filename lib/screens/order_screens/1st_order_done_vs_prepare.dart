import 'package:fit_and_fast/screens/homepage_screen.dart';
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
      int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFFFFFFFF'),
    );

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
        body: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Primo box
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Naviga alla prima pagina
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmptyPage(), // Placeholder
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
                        decoration: BoxDecoration(
                          color: boxBackgroundColor,
                          border: Border.all(color: boxBorderColor, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Se vuoi usare un'immagine, decommenta la riga sottostante
                            // Image.asset('assets/images/your_image.png', width: 40),
                            Icon(
                              Icons.rice_bowl_rounded,
                              size: 40,
                              color: textColor,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Suggeriti',
                              style: TextStyle(fontSize: 18, color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Secondo box
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Naviga alla seconda pagina
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmptyPage(), // Placeholder
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
                        decoration: BoxDecoration(
                          color: boxBackgroundColor,
                          border: Border.all(color: boxBorderColor, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Se vuoi usare un'immagine, decommenta la riga sottostante
                            // Image.asset('assets/images/your_image.png', width: 40),
                            Icon(
                              Icons.lightbulb_outline_rounded,
                              size: 40,
                              color: textColor,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Crea',
                              style: TextStyle(fontSize: 18, color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
