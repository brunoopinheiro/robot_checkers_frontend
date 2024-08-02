import 'package:flutter/material.dart';
import 'package:flutter_checkers_project/src/external/datasources/get_player_robot_server.dart';
import 'package:flutter_checkers_project/src/proto/messages.pb.dart';
import 'package:http/http.dart' as http;

class BoardStore {
  final int rows;
  final int columns;
  final double pieceSize;

  BoardStore({
    this.rows = 8,
    this.columns = 8,
    this.pieceSize = 45,
  });

  bool isWhiteSquare(int row, int column) {
    return (row % 2 == 0 && column % 2 == 1) ||
        (row % 2 == 1 && column % 2 == 0);
  }


  Color getSquareColor(int row, int column) {
    return isWhiteSquare(row, column)
        ? const Color.fromARGB(255, 32, 32, 32)
        : const Color.fromARGB(255, 219, 219, 219);
  }

  Color? getPieceColor(int row, int column) {
    if (isWhiteSquare(row, column) && (row < 3 || row > 4)) {
      return row < 3 ? Colors.purple : const Color.fromARGB(255, 22, 122, 25);
    }
    return null;
  }

   Future<Board> startGame(BuildContext context) async {
    final getStateBoard = GetStateServer();
    Board status =
        await getStateBoard.fetchBoardState();

    if (status == 200) {
      print('ok');

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao iniciar o jogo')),
      );
    }

    return status;
  }

  fetchBoardState() {
    Future<Board> fetchBoardState() async {
    final response = await http.get(Uri.parse('http://192.168.158.157:5000/game/state'));

    if (response.statusCode == 200) {
      return Board.fromBuffer(response.bodyBytes);
    } else {
      throw Exception('Failed to load board state');
    }
  }
  }
}
