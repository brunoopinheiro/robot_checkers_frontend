import 'package:http/http.dart' as http;

Future<http.Response> fetchStart() {
  return http.get(Uri.parse('https://flask/jogar'));
}

Future<http.Response> fetchState() {
  return http.get(Uri.parse('https://flask/state'));
}
