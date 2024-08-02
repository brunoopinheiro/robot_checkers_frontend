import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_player_robot_server.dart';
import 'package:flutter_checkers_project/src/presenter/stores/board_store.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart';
import 'package:http/http.dart' as http;


class BoardState with ChangeNotifier {

  Future<Board> fetchBoardState() async {
    final response = await http.get(Uri.parse('http://192.168.158.157:5000/game/state'));

    if (response.statusCode == 200) {
      return Board.fromBuffer(response.bodyBytes);
    } else {
      throw Exception('Failed to load board state');
    }
  }

}