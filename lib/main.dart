import 'package:flutter/material.dart';
import 'package:login_fenix/controller/login_controller.dart';
import 'package:login_fenix/ui/pages/login.dart';
///Archivo main que carga la pagina del login
///@aernestolopez
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoginController.initfirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      home: Login()
    );
  }
}