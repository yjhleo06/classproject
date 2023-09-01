// ignore_for_file: non_constant_identifier_names

import 'package:mongo_dart/mongo_dart.dart';

var connection_URI = "mongodb+srv://Eunseok:01098210604@gkrtodwmd.jbikhxl.mongodb.net/?retryWrites=true&w=majority/";
Db? db;

Future<void> connectToDatabase() async {
  if (db == null || db!.state != State.OPEN && db!.state != State.OPENING) {
    db = await Db.create(connection_URI);
    await db!.open(secure: true);
  } else if (db!.state == State.OPENING) {
    // 기존에 연결이 진행 중인 경우, 완료될 때까지 대기
    await db!.open();
  }
}

Future<List<dynamic>> getValuesFromDatabase() async {
  if (db == null) {
    // Handle the case when the database connection is not established
    await connectToDatabase(); // 데이터베이스 연결 설정
  }

  var collection = db!.collection('School.TestDB');
  var result = await collection.find().toList();

  List<dynamic> values = [];
  for (var document in result) {
    var name = document['name'];
    var number = document['number'];
    
    values.add({'name': name, 'number': number});

    print('Fetched data - Name: $name, Number: $number');
  }

  return values;
}

