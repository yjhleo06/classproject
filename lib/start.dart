import 'package:flutter/material.dart';
import 'mainhome.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("시작화면"),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if(details.velocity.pixelsPerSecond.dx < 0) {
              // 오른쪽에서 왼쪽으로 스와이프 했을 때
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainhome()),
              );
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/dshs.jpep.webp',
                  height: 100,
                  width: 100,
                ), // 대신고 로고 코드
              ],
            ),
          ),
        ),
      ),
    );
  }
}
