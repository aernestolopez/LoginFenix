
import 'package:flutter/foundation.dart';

class Device{
  String id, nombre, tipo;
  Uint8List imgAbierto, imgCerrado, imgEspera;
  Device({required this.id, required this.nombre,required this.tipo, required this.imgAbierto, required this.imgCerrado, required this.imgEspera});
  factory Device.fromJson(Map<String, dynamic> json){
    return Device(
      id: json['id'], 
      nombre: json['nombre'], 
      tipo: json['tipo'],
      imgAbierto: Uint8List.fromList(json['imgAbierto']['data'].cast<int>()),
      imgCerrado: Uint8List.fromList(json['imgCerrado']['data'].cast<int>()),
      imgEspera: Uint8List.fromList(json['imgEspera']['data'].cast<int>()),
      );
  }
}