import 'package:flutter/foundation.dart';

class Device{
  String id, nombre, tipo;
  Device({required this.id, required this.nombre,required this.tipo});
  factory Device.fromJson(Map<String, dynamic> json){
    return Device(
      id: json['id'], 
      nombre: json['nombre'], 
      tipo: json['tipo']
      );
  }
}