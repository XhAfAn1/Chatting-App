import 'package:chattingapp/data/sharedpref.dart';
import 'package:chattingapp/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import '../myhomepage.dart';

class Authentication {
  Future<void> signup(
      {required String email, required String password}) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      if(e.code=='weak-password'){
        print(e.code);
      }
      else if(e.code=='email-already-in-use'){
        print(e.code);
      }
      else if(e.code=='invalid-email'){
        print(e.code);
      }

    }
    catch(e){
      print(e);
    }
  }



  Future<void> signin(
      {required String email, required String password,context}) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print("success");
      await Future.delayed(Duration(seconds: 1));
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setBool(KEYLOGIN, true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const homepage(),));

    } on FirebaseAuthException catch (e){
      if(e.code=='user-not-found'){
        print(e.code);
      }
      else if(e.code=='wrong-password'){
        print(e.code);
      }
      else if(e.code=='invalid-email'){
        print(e.code);
      }
      else if(e.code=='user-disabled'){
        print(e.code);
      }

    }
    catch(e){
      print(e);
    }
  }

  Future<void> signout(context) async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(KEYLOGIN, false);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const login(),));
  }




}
