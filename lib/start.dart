import 'package:flutter/material.dart';
import 'mainhome.dart';

class Start extends StatelessWidget {
  const Start ({super.key}); // Start라는 파일의 키

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("시작화면"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/dshs.jpep.webp',
                height: 100,
                width: 100,
              ), // 대신고 로고 코드
              ElevatedButton(
                onPressed: () {
                  Navigator.push( // Navigator.push로 다른 화면으로 전환해야 함
                    context,
                    MaterialPageRoute(builder: (context) => Mainhome()), // 메인화면으로 이동해 주라고 요청하는 코즈
                  );
                },
                child: Text('시작'),
              ), //버튼
            ],
          ),
        ),
      ),
    );
  }
}
