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

  @override
  void initState() {
    super.initState();
    HttpController hc=HttpController();
    futureDevice=hc.ObtenerDispositivo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Device?>(
            future: futureDevice,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.nombre+" "+ snapshot.data!.id + " "+ snapshot.data!.tipo);
                
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
        
        
        /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Container(
                child: Text(
                  "Esperando",
                  style: TextStyle(fontSize: 42),
                ),
              ),
            ),
            Flexible(
              flex: 14,
              child: Image(
                image: NetworkImage("https://i.imgur.com/kBxCOFq.png"),
              ),
            ),
            Flexible(
                flex: 10,
                child: SizedBox(
                  height: 100,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Conectarse',
                        style: TextStyle(fontSize: 22)),
                  ),
                ))
          ],
        ),*/
        return const CircularProgressIndicator();
            }
            
      ),
      )
    );
  }
}
