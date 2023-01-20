// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Carga extends StatefulWidget {
  const Carga({super.key});

  @override
  State<Carga> createState() => _CargaState();
}
  //var arr=['','',''];
class _CargaState extends State<Carga> {

  /*@override
  void initState() { 
    super.initState();
    getUrl();
    
  }

  void getUrl() async{
    CollectionReference collectionReference= FirebaseFirestore.instance.collection("Imagenes");
    QuerySnapshot url = await collectionReference.get();
    if(url.docs.isNotEmpty){
      for(var doc in url.docs){
        print(doc.get("url_correcto"));
        arr[0]=doc.get("url_correcto");
        arr[1]=doc.get("url_denegado");
        arr[2]=doc.get("url_esperando");
        print(arr);
        
      }
    }
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Flexible(flex: 6, child:Container(child: Text("Esperando", style: TextStyle(fontSize: 42),),),),
              Flexible(flex: 14, child: Image( image: NetworkImage("https://i.imgur.com/kBxCOFq.png"),
              ),),
              Flexible(flex: 10,child:SizedBox(
                height: 100,
                width: 150,
                child:ElevatedButton(
                      onPressed: () {
                       //print(arr);
                      },
                      child: const Text('Conectarse', style: TextStyle(fontSize: 22)),
              ) ,))
              
            ],
          ),
      ),
      /*body: Column(
        children: [
          const Center(
            child: Image(width: 550, height: 600, image: NetworkImage("https://i.imgur.com/kBxCOFq.png"),
            )
            ),
           Align(
                alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                     //print(arr);
                    },
                    child: const Text('Conectarse'),  // trying to move to the bottom
                  ),
              )
        ],
      ),*/
    );
  }
}