import 'package:flutter_checkers_project/src/proto/messages.pb.dart';
import 'package:http/http.dart' as http;

class GetStateServer {
  Future<Board> fetchBoardState() async {
    final response = await http
        .get(Uri.parse('http://localhost:5000/game/state'))
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 404) {
      throw Exception('No dames found or game not started');
    } else if (response.statusCode != 200) {
      throw Exception('Failed to fetch board state');
    }

    return Board.fromBuffer(response.bodyBytes);
  }
}
