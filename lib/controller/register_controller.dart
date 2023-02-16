import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_fenix/main.dart';
class RegisterController{
  static Future comprobarRegister(email, pass, context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyApp();
            })));
  } catch (e) {
    Fluttertoast.showToast(
      msg: e.toString(),
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
}