import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../widgets/navbar.dart';
import '../../widgets/phone_screen.dart';
import '../MyEmptyPage.dart';

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
      image: '../../assets/image3.png',
      description: 'Pasta Carbonara',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image2.png',
      description: 'Cheese Burger',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image1.png',
      description: 'Pizza Margherita',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image2.png',
      description: 'Sushi Roll',
      values: [42, 42, 42],
    ),
    MenuItem(
      image: '../../assets/image1.png',
      description: 'Caesar Salad',
      values: [42, 42, 42],
    ),
  ];
}

List<MenuItem> generateAlternateDummyData() {
  return [
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
      description: 'Pizza Margherita',
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
      description: 'Pizza Margherita',
      values: [42, 42, 42],
    ),
  ];
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<List<MenuItem>> menuSections = [
    generateDummyData(),
    generateAlternateDummyData(),
    generateDummyData(),
    generateAlternateDummyData(),
    generateDummyData(),
  ];

  final List<String> names = [
    'Carboidrati',
    'Proteine',
    'Grassi',
    'Dolci',
    'Bevande',
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(
      int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF388E3C'),
    );
    Color textColor = Color(
      int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFFFFFFFF'),
    );
    Color backgroundColor = Color(
      int.parse(dotenv.env['BACKGROUND_COLOR'] ?? '0xFFFFFFFF'),
    );

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
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(names.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                      vertical: 10,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedCategoryIndex == index
                            ? primaryColor
                            : backgroundColor,
                        foregroundColor: textColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Text(names[index]),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuSections[selectedCategoryIndex].length,
                itemBuilder: (context, itemIndex) {
                  final item = menuSections[selectedCategoryIndex][itemIndex];
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmptyPage()),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: primaryColor, width: 2),
                        ),
                        color: backgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
                          child: Row(
                            children: [
                              SizedBox(width: 40),
                              Image.asset(
                                item.image,
                                width: 70,
                              ),
                              SizedBox(width: 40),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.description,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                    Text(
                                      '${item.values[0]} - ${item.values[1]} - ${item.values[2]}',
                                      style: TextStyle(color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
