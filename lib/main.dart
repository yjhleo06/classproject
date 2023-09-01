import 'package:flutter/material.dart';
import 'dbScreen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
   Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(        
        child:
         Column(
          mainAxisAlignment:
           MainAxisAlignment.center,
          children:<Widget>[
            const Text('This is the Main Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>const DbScreen()));
              },
              child : const Text('학생증 조회'),
            ),
          ],
        ),        
       ),     
     );
   }
}
