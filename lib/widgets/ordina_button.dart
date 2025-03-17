import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../screens/menus/menu_screen.dart';
import '../screens/order_screens/1st_order_done_vs_prepare.dart';

class Ordina_button extends StatelessWidget{
  const Ordina_button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(int.parse(dotenv.env['BUTTON_BACKGROUND'] ?? '0xFFFFA500')),
        shadowColor: Color(int.parse(dotenv.env['SHADOW_COLOR'] ?? '0xFFFFA500')),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Color(int.parse(dotenv.env['BORDER_COLOR'] ?? '0xFF888888')), width: 4),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        minimumSize: Size(350, 100),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DoneVsPrepare()),
      ),

      child: Text(
        'ORDINA',
        style: TextStyle(
          color: Color(int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFF000000')),
          fontSize: 44,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}