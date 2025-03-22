import 'package:fit_and_fast/widgets/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../widgets/navbar.dart';

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

List<MenuItem> generateDummyData() {
  return [
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
}

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final List<List<MenuItem>> menuSections = [
    generateDummyData(),
    generateDummyData(),
    generateDummyData(),
    generateDummyData(),
    generateDummyData(),
  ];

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(
      int.parse(dotenv.env['CAROUSEL_BACKGROUND'] ?? '0xFF388E3C'),
    );
    Color textColor = Color(
      int.parse(dotenv.env['CAROUSEL_TEXT'] ?? '0xFFFFFFFF'),
    );
    final List<String> names = [
      'Carboidrati',
      'Proteine',
      'Grassi',
      'Dolci',
      'Bevande',
    ];

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
            Center(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 550,
                  enlargeCenterPage: false,
                  viewportFraction: 0.85,
                  enableInfiniteScroll: false,
                ),
                itemCount: menuSections.length,
                itemBuilder: (context, index, realIndex) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: backgroundColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: menuSections[index].length,
                            itemBuilder: (context, itemIndex) {
                              final item = menuSections[index][itemIndex];
                              return ListTile(
                                leading: Image.asset(item.image, width: 40),
                                title: Text(
                                  item.description,
                                  style: TextStyle(color: textColor),
                                ),
                                trailing: Text(
                                  '${item.values[0]} - ${item.values[1]} - ${item.values[2]}',
                                  style: TextStyle(color: textColor),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavbar(currentIndex: 1),
      ),
    );
  }
}
