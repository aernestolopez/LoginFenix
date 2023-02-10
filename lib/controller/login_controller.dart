import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_fenix/ui/pages/login.dart';
import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ui/pages/home.dart';
class LoginController{

static Future initfirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

static Future comprobarLogin(email, pass, context) async {
  try {
    await auth
        .signInWithEmailAndPassword(email: email, password: contrasenia)
        .then((value) =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
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

static Future logOut(context) async {
  await FirebaseAuth.instance.signOut().then(
      (value) => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Login();
          })));
}
}