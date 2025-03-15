import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ButtonRow extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(int.parse(dotenv.env['BUTTON_BACKGROUND'] ?? '0xFFFFA500')),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(int.parse(dotenv.env['BORDER_COLOR'] ?? '0xFF888888')), width: 4),
            boxShadow: [
              BoxShadow(
                color: Color(int.parse(dotenv.env['SHADOW_COLOR'] ?? '0xFFFFA500')),
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.info, color: Color(int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFFFFA500'))),
            onPressed: () {},
            padding: EdgeInsets.all(10),  // Aggiungi padding per far apparire il bottone più grande
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(int.parse(dotenv.env['BUTTON_BACKGROUND'] ?? '0xFFFFA500')),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(int.parse(dotenv.env['BORDER_COLOR'] ?? '0xFF888888')), width: 4),
            boxShadow: [
              BoxShadow(
                color: Color(int.parse(dotenv.env['SHADOW_COLOR'] ?? '0xFFFFA500')),
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.settings, color: Color(int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFFFFA500'))),
            onPressed: () {},
            padding: EdgeInsets.all(10),  // Aggiungi padding per far apparire il bottone più grande
          ),
        ),
      ],
    );
  }
}