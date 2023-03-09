import 'dart:convert';

import 'package:login_fenix/services/http_service.dart';
import 'package:login_fenix/model/device.dart';
///Controlador para Http
///@aernestolopez
class HttpController{
  HttpService hs= HttpService();
  Future<Device?> ObtenerDispositivo() async{
    final response=await hs.fetchDevice();
    if(response.statusCode==200){
      return Device.fromJson(jsonDecode(response.body));
    }else{
        throw Exception("No se pudo obtener el dispositivo");
    }
  }
}