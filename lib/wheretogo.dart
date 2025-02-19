import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/sharedpref.dart';
import 'login.dart';
import 'myhomepage.dart';

class mainlog extends StatefulWidget {
  const mainlog({super.key});

  @override
  State<mainlog> createState() => _mainlogState();
}

class _mainlogState extends State<mainlog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wheretogo();
  }
  @override
  Widget build(BuildContext context) {
    return login();
  }
  wheretogo() async {
    bool? isLoggedIn;
    getInstance();
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLoggedIn=await sp.getBool(KEYLOGIN);
    if(isLoggedIn!=null){
      if(isLoggedIn){

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const MyHomePage(),));

      }
      else{

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>const login(
          ),
        ));
      }
    }else{


      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=>const login(),
      ));
    }


  }
}
