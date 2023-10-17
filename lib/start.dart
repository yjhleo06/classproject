import 'package:flutter/material.dart';
import 'mainhome.dart';

class Start extends StatelessWidget {
  const Start ({super.key}); // Start라는 파일의 키

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("메인화면"),
        ),
        body: Center(
          child: Column( // Row 대신 Column으로 수정 (이미지와 버튼을 세로로 배치)
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/dshs.jpep.webp',
                height: 100,
                width: 100,
              ), // 파일 확장자가 .jpep.webp 가 아닌 .jpg 여야 함
              ElevatedButton(
                onPressed: () {
                  Navigator.push( // Navigator.push로 다른 화면으로 전환해야 함
                    context,
                    MaterialPageRoute(builder: (context) => Mainhome()),
                  );
                },
                child: Text('시작'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
