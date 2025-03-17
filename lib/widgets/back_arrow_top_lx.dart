import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BackArrow extends StatelessWidget{
  final VoidCallback onPressed;

  const BackArrow({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 20,
      left: 10,
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFF888888'))),
        onPressed: onPressed,
      ),
    );
  }
}
