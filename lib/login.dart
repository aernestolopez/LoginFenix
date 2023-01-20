// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_fenix/home.dart';

class Login extends StatefulWidget {
   const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
late String email, contrasenia;
FirebaseAuth auth=FirebaseAuth.instance;
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: cuerpo(context) 
    );
  }
}

Widget cuerpo(BuildContext context){
  return Container(
    decoration: const BoxDecoration(
      image:DecorationImage(
        image: AssetImage('assets/primaryBg.png'),
        fit: BoxFit.cover
        )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            const Image(image: AssetImage("assets/smartfenix.png"), width: 300,),
            SizedBox(height:20,),
            nombre(),
            SizedBox(height: 20,),
            campoUsuario(),
            campoContrasenia(),
            SizedBox(height:40,),
            botonEntrar(context)
          ],
          ),
        ),
  );
}

Widget nombre(){
  return const Text("Bienvenido/a", style: TextStyle(color:  Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),);
}

Widget campoUsuario(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
    child: SizedBox(
      width: 250.0,
      child: TextField(
        onChanged: (value){
          email=value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29.0),),
          hintText: "Correo Electrónico",
          prefixIcon: const Icon(Icons.person),
          fillColor: Colors.white60,
          filled: true,
        ),
      ),
    ),
  );
}

Widget campoContrasenia(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
    child: SizedBox(
      width: 250.0,
      child: TextField(
         onChanged: (value){
          contrasenia=value;
        },
        obscureText:true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29.0),),
          hintText: "Contraseña",
          prefixIcon: const Icon(Icons.security),
          fillColor: Colors.white60,
          filled: true
        ),
      ),
    ),
  );
}

Widget botonEntrar(BuildContext context){
  return SizedBox(
    height: 50,
    child: TextButton(
      onPressed: () async{
        try{
          await auth.signInWithEmailAndPassword(
          email: email, password: contrasenia).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context){
            return Home();
          })));
          
        }catch(e){
    Fluttertoast.showToast(
      msg: e.toString(),
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
        }
      },
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
      child: const Text("Iniciar Sesion", style: TextStyle(fontSize: 25)),
    ),
  );
}