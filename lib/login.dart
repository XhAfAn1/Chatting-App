import 'package:chattingapp/data/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myhomepage.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setBool(KEYLOGIN, true);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyHomePage(),));
        }, child: Text("login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
