import 'package:flutter/material.dart';
import 'start.dart';

class Mainhome extends StatelessWidget {
  const Mainhome ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("메인화면"),
        ),
        body: Center(
          child: Row(
            children: [


            ],
          ),
        ),
      ),
    );
  }
}