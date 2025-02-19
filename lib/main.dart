import 'package:chattingapp/data/sharedpref.dart';
import 'package:chattingapp/login.dart';
import 'package:chattingapp/wheretogo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'fetch_data.dart';
import 'insert_data.dart';
import 'myhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainlog(),
      //home: const MyHomePage(),
    );
  }

}
