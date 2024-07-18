import 'package:http/http.dart' as http;

Future<http.Response> fetchStart() {
  return http.get(Uri.parse('https://flask/start_game'));
  
}

Future<http.Response> fetchState() {
  return http.post(Uri.parse('https://flask/update_board'));
}

Future<http.Response> fetchBoard() {
  return http.post(Uri.parse('https://flask/robot_turn'));
}
