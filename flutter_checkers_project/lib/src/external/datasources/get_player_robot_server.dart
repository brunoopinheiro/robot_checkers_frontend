import 'package:http/http.dart' as http;

class GetPlayerRobotServer {
  Future<void> indicateRobotPlay() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:5000/game/robot_play'))
          .timeout(const Duration(seconds: 160));

      if (response.statusCode != 200) {
        throw Exception('Failed to indicate robot play');
      }
    } catch (e) {
      throw Exception('Failed to indicate robot play: $e');
    }
  }
}
