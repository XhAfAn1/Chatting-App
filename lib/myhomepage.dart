
import 'package:chattingapp/data/firebaseauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/sharedpref.dart';
import 'fetch_data.dart';
import 'homePage.dart';
import 'insert_data.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            const SizedBox(
              height: 30,
            ),
            const Text(
              'Firebase Realtime Database Series in Flutter 2022',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InsertData()));
              },
              child: const Text('Insert Data'),
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FetchData()));
              },
              child: const Text('Fetch Data'),
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
            ),
            MaterialButton(
              onPressed: () async{

                Authentication().signout(context);

                // SharedPreferences sp = await SharedPreferences.getInstance();
                // sp.setBool(KEYLOGIN, false);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => const login()));
              },
              child: const Text('logout'),
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const homepage(),));
            }, child: Text("test page")),

          ],
        ),
      ),
    );
  }
}

