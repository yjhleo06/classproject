import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db;

// db 관련 선언
void database() async {
  var db = await Db.create('mongodb+srv://Eunseok:01098210604@gkrtodwmd.jbikhxl.mongodb.net/?retryWrites=true&w=majority');
  await db.open();

  // 컬렉션 선택
  var collection = db.collection('School/TestDB');

  // 쿼리 실행
  var result = await collection.find().toList();

  //결과 출력
  for (var doc in result) {
    print(doc);
    } 
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{

}
