// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_fenix/controller/login_controller.dart';
import 'package:login_fenix/ui/pages/register.dart';
///Pagina para loging
///@aernestolopez
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
    //Creamos un BoxDecoration para insertar la imagen
    decoration: const BoxDecoration(
      image:DecorationImage(
        //Insertamos la imagen
        image: AssetImage('assets/primaryBg.png'),
        fit: BoxFit.cover
        )
      ),
      child: Center(
        child: Column(
          //Alinemaos la columna al centro
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            //Añadimos la imagen
            const Image(image: AssetImage("assets/smartfenix.png"), width: 300,),
            //Dejamos un espacio
            SizedBox(height:20,),
            //Llamamos al metodo para dar la bienvenida
            nombre(),
            SizedBox(height: 20,),
            //Llamamos al metodo que provee de un campo de texto para introducir el correo
            campoUsuario(),
            //Llamamos al metodo para introducir la contraseña
            campoContrasenia(),
            SizedBox(height:20,),
            //Lamamos al metodo para poder entrar con un boton
            botonEntrar(context),
            SizedBox(height: 20,),
            Text("¿No tienes cuenta?", style: TextStyle(fontSize: 18),),
            SizedBox(height: 10,),
            //Metodo que nos envia a la ventana de registro
            botonRegister(context)
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
      //Creamos un TextField
      child: TextField(
        //Guardamos el valor que el usuario introduce
        onChanged: (value){
          email=value;
        },
        //Decoramos el TextField
        decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29.0),),
        //Creamos un hint con lo que el usuario debe introducir
          hintText: "Correo Electrónico",
          //Añadimos un incono
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
      //Creamos un TextField
      child: TextField(
        //Guardamos el valor que el usuario introduce
         onChanged: (value){
          contrasenia=value;
        },
        obscureText:true,
        //Decoramos el TextField
        decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(29.0),),
        //Creamos un hint con lo que el usuario debe introducir
          hintText: "Contraseña",
          //Añadimos un incono
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
    width: 220,
    child: TextButton(
      onPressed: () {
        //Llamamos al metodo que comprueba que los datos sean correctos
        LoginController.comprobarLogin(email, contrasenia, context);
      },
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        //Añadimos un texto al boton
      child: const Text("Iniciar Sesion", style: TextStyle(fontSize: 25)),
    ),
  );
}

Widget botonRegister(BuildContext context){
  return SizedBox(
    height: 50,
    width: 220,
    child: TextButton(
      onPressed: () {
        //Enviamos al usuario a otra ventana
        Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Register();
            }));
      },
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        //Añadimos texto al boton
      child: const Text("Registrarse", style: TextStyle(fontSize: 25)),
    ),
  );
}