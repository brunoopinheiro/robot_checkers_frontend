import 'package:http/http.dart' as http;

class GetWinnerStatus {
  Future<http.Response> checkWinner() async {
    final url = Uri.parse('https://your-api-endpoint.com/vencedor');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to check winner');
    }
  }
}
