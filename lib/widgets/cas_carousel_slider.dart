import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/cupertino.dart';

class MyCarouselSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
      items: [
        '../../assets/image2.png',
        '../assets/image1.png',
        '../assets/image3.png'
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 350,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFFFFA500')),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(int.parse(dotenv.env['BORDER_COLOR'] ?? '0xFF888888')), width: 4),
              ),
              child: FittedBox(
                fit: BoxFit.contain,  // Aggiungi questa riga per fare in modo che l'immagine sia contenuta nel box
                child: Image.asset(imagePath),
              ),
            );
          },
        );
      }).toList(),

    );
  }
}