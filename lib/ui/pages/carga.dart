// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_fenix/model/device.dart';
import '../../controller/http_controller.dart';

class Carga extends StatefulWidget {
  const Carga({super.key});

  @override
  State<Carga> createState() => _CargaState();
}

class _CargaState extends State<Carga> {
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
     return Column(
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
           leading: Icon(Icons.devices_sharp),
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
                     //return Text("Nombre Dispositivo: ${snapshot.data!.nombre} Tipo: ${snapshot.data!.tipo}");
                    
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
       ],
       
     );
     
  }
}
