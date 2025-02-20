import 'package:flutter/material.dart';

import 'data/firebaseauth.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "Enter Username"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "Enter Password"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 50),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  backgroundColor: Colors.blueAccent),
              onPressed: () async {
                Authentication().signup(email: email.text, password: password.text);
                // SharedPreferences sp = await SharedPreferences.getInstance();
                // sp.setBool(KEYLOGIN, true);
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyHomePage(),));
              },
              child: Text("Sign Up",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),


        ],
      ),

      // body: Center(
      //   child: ElevatedButton(onPressed: () async{
      //     SharedPreferences sp = await SharedPreferences.getInstance();
      //     sp.setBool(KEYLOGIN, true);
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyHomePage(),));
      //   }, child: Text("login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      // ),
    );
  }
}
