import 'package:fit_and_fast/widgets/phone_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/back_arrow_top_lx.dart';

class EmptyPage extends StatelessWidget{
  const EmptyPage({super.key});
  @override
  Widget build(BuildContext context){
    return PhoneScreen(
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset('../../../assets/logo.png', height: 70),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackArrow(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Center(
                child: Text('Nothing here', style: TextStyle(fontSize: 24, color: Color(0xFFFF9900))),
              ),
            ]
          ),
        ),
    );
  }
}