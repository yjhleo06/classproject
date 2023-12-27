import 'package:flutter/material.dart';
import 'student/st20416.dart';
import 'student/st20401.dart';


class Main_id extends StatelessWidget {
  const Main_id ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('학생증'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: '학생증 번호를 입력하세요',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                switch (controller.text) {
                  case '20416':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => st20416()),
                    );
                    break;
                  case '20401':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => st20401()),
                    );
                    break;
                  default:
                    print('해당 학생증 번호의 화면이 존재하지 않습니다.');
                    break;
                }
              },
              child: Text('해당 학생증 화면으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}

