// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_fenix/model/device.dart';
import '../../controller/http_controller.dart';
import '../../controller/login_controller.dart';
///Pagina principal de la aplicacion tras iniciar sesion
///@aernestolopez
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Device?> futureDevice;
  String estado="Espera";

  @override
  void initState() {
    super.initState();
    HttpController hc=HttpController();
    futureDevice=hc.ObtenerDispositivo();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar:AppBar(
        automaticallyImplyLeading: false,
        title:RichText(text: TextSpan(text: "SmartFenix", style: TextStyle(fontSize: 25), recognizer: TapGestureRecognizer()..onSecondaryTap=() {
          LoginController.logOut(context);
        })),
        centerTitle: true,
      ),
       body: Column(
         children: [
           Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             margin: EdgeInsets.all(15),
              elevation: 10,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
              ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Dispositivo', textAlign: TextAlign.center,),
                     ),
                 FutureBuilder<Device?>(
                   future:futureDevice,
                   builder: ((context, snapshot){
                     if(snapshot.hasData){
                      return Text("Nombre Dispositivo: ${snapshot.data!.nombre} Tipo: ${snapshot.data!.tipo}");
                      
                     } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                  return const CircularProgressIndicator();
                   }
                 )
                 ),
                 Row(
                   children: <Widget>[const SizedBox(height: 20),]
                 ),
                 
         ],
             ),
           ),
         Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             margin: EdgeInsets.all(15),
              elevation: 10,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
              ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 5, 25, 0),
            title: Text(estado, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                     ),
                 FutureBuilder<Device?>(
                   future:futureDevice,
                   builder: ((context, snapshot){
                     if(snapshot.hasData){
                      switch (estado) {
                        case "Espera":
                          return Image.memory(snapshot.data!.imgEspera, width: 300, height: 300,);
                          case "Abierto":
                          return Image.memory(snapshot.data!.imgAbierto, width: 300, height: 300,);
                          case "Cerrado":
                          return Image.memory(snapshot.data!.imgCerrado, width: 300, height: 300,);
                        default:
                        return Image.memory(snapshot.data!.imgEspera, width: 300, height: 300,);
                      }
                     } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                  return const CircularProgressIndicator();
                   }
                 )
                 ),
                 Row(
                   children: <Widget>[const SizedBox(height: 20),]
                 ),
               ],
             ),
           ),
         ]
         
       ),
     );
     
     
  }
}
