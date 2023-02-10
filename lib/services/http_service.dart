import 'package:http/http.dart' as http;
class HttpService{
  Future <http.Response> fetchDevice() {
  return http.get(Uri.parse('192.168.1.192:1289/getDevice'));
}
}