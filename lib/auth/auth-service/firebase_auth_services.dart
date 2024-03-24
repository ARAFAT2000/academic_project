import 'dart:async';


import 'package:academic_project/page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';


class SplassService{
  void isLogIn(BuildContext context){
    final _auth=FirebaseAuth.instance;
    final user= _auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 3), () {

        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
      });
    }else{
      Timer(Duration(seconds: 3), () {

        Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
      });
    }
  }


}