import 'package:chattingapp/data/sharedpref.dart';
import 'package:chattingapp/login.dart';
import 'package:chattingapp/wheretogo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyAMsySvvF3CuLOg9qfAIbPbIRsvo5hRJqI",
        authDomain: "chatting-app-e6f54.firebaseapp.com",
        databaseURL: "https://chatting-app-e6f54-default-rtdb.firebaseio.com",
        projectId: "chatting-app-e6f54",
        storageBucket: "chatting-app-e6f54.firebasestorage.app",
        messagingSenderId: "35836615837",
        appId: "1:35836615837:web:9aeaaff171a13c38408874",
        measurementId: "G-M87N2LSKZ8"
    ));

  }else
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainlog(),
      //home: const MyHomePage(),
    );
  }

}
