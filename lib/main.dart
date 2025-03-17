import 'package:fit_and_fast/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: dotenv.env['APP_TITLE'] ?? 'Flutter App',
      theme: ThemeData(
        primaryColor: Color(int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF4CAF50')),
      ),
      home: HomePage(),
    );
  }
}
