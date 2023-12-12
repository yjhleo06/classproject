import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:classproject/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

// 코드의 나머지 부분...

class CustomCenter extends StatelessWidget {
  final Widget child;

  const CustomCenter({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: child,
    );
  }
}


class BarcodeDatabase {
  static Future<void> insertBarcode(String barcodeValue, String studentId) async {
  final db = await Db.create(MONGO_CONN_URL);
  await db.open();
  final barcodeCollection = db.collection(USER_COLLECTION);

  final barcodeData = {
  'barcodeValue': barcodeValue,
  '학번': studentId,
  };

  await barcodeCollection.insert(barcodeData);

  await db.close();
  }

  static Future<String?> getBarcodeBystudentId(String studentId) async {
  final db = await Db.create(MONGO_CONN_URL);
  await db.open();
  final barcodeCollection = db.collection(USER_COLLECTION);

  final query = where.eq('학번', studentId);
  final barcodeData = await barcodeCollection.findOne(query);

  await db.close();

  if (barcodeData != null) {
  return barcodeData['barcodeValue'] as String?;
  } else {
  return null;
  }
  }
}

class school_id extends StatelessWidget {
  const school_id({super.key});

  @override
  Widget build(BuildContext context) {
    String barcodeValue = '';

    return MaterialApp(
      title: 'Barcode App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode App'),
        ),
        body: CustomCenter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (barcodeValue.isNotEmpty)
                SfBarcodeGenerator(
                  value: barcodeValue,
                  showValue: false,
                ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  barcodeValue = value;
                },
                decoration: InputDecoration(
                  labelText: '바코드 번호 입력',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final studentId = '20230001'; // 입력된 학번을 가져와서 사용하도록 수정해야 합니다.
                  await BarcodeDatabase.insertBarcode(barcodeValue, studentId);
                },
                child: Text('바코드 삽입'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final studentId = '20230001'; // 입력된 학번을 가져와서 사용하도록 수정해야 합니다.
                  final barcode = await BarcodeDatabase.getBarcodeBystudentId(studentId);
                  if (barcode != null) {
                  barcodeValue = barcode;
                  } else {
                  barcodeValue = '바코드 없음';
                  }
                },
                child: Text('바코드 불러오기'),
              ),
            ],
          ),
        )
      ),
    );
  }
}



