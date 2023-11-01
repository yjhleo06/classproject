import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class school_id extends StatelessWidget {
  const school_id({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodeScreen(),
    );
  }
}

class BarcodeScreen extends StatefulWidget {
  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  String barcodeValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (barcodeValue.isNotEmpty)
              SfBarcodeGenerator(
                value: barcodeValue,
               // symbology: BarcodeSymbology.code128,
                showValue: false,
              ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  barcodeValue = value;
                });
              },
              decoration: InputDecoration(
                labelText: '바코드 번호 입력',
              ),
            ),
          ],
        ),
      ),
    );
  }
}




