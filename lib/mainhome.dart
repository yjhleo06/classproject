import 'package:flutter/material.dart';
import 'school_id.dart';
import 'etc.dart';


class Mainhome extends StatelessWidget {
  const Mainhome ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("메인화면작"),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'images/dshs.jpep.webp',
                height: 100,
                width: 100,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push( // Navigator.push로 다른 화면으로 전환해야 함
                      context,
                      MaterialPageRoute(builder: (context) => school_id()), // 학생증으로 이동해 주라고 요청하는 코즈
                    );
                  },
                  child: Text('학생증'),
                ), //버튼
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push( // Navigator.push로 다른 화면으로 전환해야 함
                      context,
                      MaterialPageRoute(builder: (context) => etc()), // 부가기능 으로 이동해 주라고 요청하는 코즈
                    );
                  },
                  child: Text('부가 기능'),
                ), //버튼
              )
            ],
          ),
        ),
      ),
    );
  }
}