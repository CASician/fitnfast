import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PhoneScreen extends StatelessWidget {
  final Widget child;
  const PhoneScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Container(
          width: 400,
          height: 800,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Color(int.parse(dotenv.env['BACKGROUND_COLOR'] ?? '0xFFFFFFFF')),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color(int.parse(dotenv.env['BORDER_COLOR'] ?? '0xFF888888')), width: 4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: child,
          ),
        ),
      ),
    );
  }
}