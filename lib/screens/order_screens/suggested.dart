import 'package:fit_and_fast/screens/order_screens/1st_order_done_vs_prepare.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../widgets/back_arrow_top_lx.dart';
import '../../widgets/phone_screen.dart';
import '../MyEmptyPage.dart';

class Suggested extends StatelessWidget {
  Suggested({super.key});

  // Dati dummy per ogni categoria
  final List<String> categories = ["Best deals", "Bulk", "Low Carbs"];
  final List<MenuItem> dummyData = [
    MenuItem(
      image: '../../assets/image1.png',
      description: 'Pizza Margherita',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image2.png',
      description: 'Cheese Burger',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image3.png',
      description: 'Pasta Carbonara',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image1.png',
      description: 'Caesar Salad',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image2.png',
      description: 'Sushi Roll',
      values: [42, 42, 42],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Colori definiti dal dotenv
    Color primaryColor = Color(
      int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF388E3C'),
    );
    Color backgroundColor = Color(
      int.parse(dotenv.env['BACKGROUND_COLOR'] ?? '0xFFFFFFFF'),
    );
    Color textColor = Color(
      int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFFFFFFFF'),
    );

    return PhoneScreen(
      child: Scaffold(
        appBar: AppBar(
          leading: BackArrow(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoneVsPrepare())
              );
            },
          ),
          title: Image.asset('../../../assets/logo.png', height: 70),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(categories.length, (categoryIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titolo della categoria
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        categories[categoryIndex],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    // Card degli elementi
                    Column(
                      children: List.generate(
                        3, // Numero di elementi dummy per categoria
                            (itemIndex) {
                          final item = dummyData[itemIndex % dummyData.length];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmptyPage(),
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: primaryColor, width: 2),
                              ),
                              color: backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    // Spazio per l'immagine
                                    Container(
                                      width: 100, // Riserva lo spazio per l'immagine
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        item.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // Testi a destra
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.description,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: textColor,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '${item.values[0]} - ${item.values[1]} - ${item.values[2]}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: textColor),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '€15.00',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String image;
  final String description;
  final List<int> values;

  MenuItem({
    required this.image,
    required this.description,
    required this.values,
  });
}
