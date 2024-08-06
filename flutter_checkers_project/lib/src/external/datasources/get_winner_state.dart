import 'package:http/http.dart' as http;

class GetWinnerStatus {
  Future<http.Response> checkWinner() async {
    final url = Uri.parse('http://localhost:5000/game/check_winner');
    final response = await http.get(url);

    if (response.statusCode == 204 || response.statusCode == 404) {
      return response;
    } else {
      throw Exception('Failed to check winner');
    }
  }
}
