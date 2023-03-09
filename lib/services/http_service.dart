import 'package:http/http.dart' as http;
///Servicio Http para obtener un dispositivo
///@aernestolopez
class HttpService {

  //Metodo para obtener un solo dispositivo
  Future<http.Response> fetchDevice() {
    //Nos conectamos a la ruta para obtener un dispositivo segun su id
    return http.get(Uri.parse('http://192.168.1.194:1289/getDevice/111'));
  }
}
