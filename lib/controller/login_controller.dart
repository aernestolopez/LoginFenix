
/// Controlador para los metodos de iniciar sesion y cerrar sesion
/// @aernestolopez
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_fenix/ui/pages/home.dart';
import 'package:login_fenix/ui/pages/login.dart';
import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController{

static Future initfirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

static Future comprobarLogin(email, pass, context) async {
  try {
    //Intentamos iniciar sesion con FirebaseAuth con los datos introducidos
    //Si se puede se envia a la siguiente pagina
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Home();
            })));
  } //Si no se puede iniciar sesion se muestra un mensaje de error
  catch (e) {
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