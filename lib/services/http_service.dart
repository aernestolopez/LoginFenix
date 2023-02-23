import 'package:http/http.dart' as http;


class HttpService {


  Future<http.Response> fetchDevice() {


    return http.get(Uri.parse('http://192.168.1.194:1289/getDevice/111'));
  }
}
