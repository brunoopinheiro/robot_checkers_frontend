import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart';
import 'package:http/http.dart' as http;

class GetPlayerRobotServer {
    Future<Board> indicateRobotPlay() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/game/robot_play')).timeout(const Duration(seconds: 20));

    if (response.statusCode == 404) {
      throw Exception('No dames found or game not started');
    } else if (response.statusCode != 200) {
      throw Exception('Failed to fetch board state');
    }

    return Board.fromBuffer(response.bodyBytes);
  }
}
