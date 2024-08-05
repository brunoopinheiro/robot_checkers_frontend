import 'package:http/http.dart' as http;

class GetPlayerRobotServer {
  Future<void> indicateRobotPlay() async {
    final response = await http.get(Uri.parse('http://192.168.158.157:5000/game/robot_play'));

    if (response.statusCode != 200) {
      throw Exception('Failed to indicate robot play');
    }
  }
}