// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'db.dart' as database;

class DbScreen extends StatefulWidget {
  const DbScreen({Key? key}) : super(key: key);

  @override
  _DbScreenState createState() => _DbScreenState();
}

class _DbScreenState extends State<DbScreen> {
  List<dynamic> _databaseValues = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  Future<void> fetchDataFromDatabase() async {
    var values = await database.getValuesFromDatabase();

    setState(() {
      _databaseValues = values;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DB Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is the DB Screen'),
            ElevatedButton(
              onPressed: () => fetchDataFromDatabase(),
              child: const Text('조회'),
            ),
            const SizedBox(height: 20),
            for (var value in _databaseValues)
              Column(
                children: [
                  Text('Name: ${value['name']}'),
                  Text('Number: ${value['number']}'),
                  const SizedBox(height: 10),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
